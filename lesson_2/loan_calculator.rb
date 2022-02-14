require 'yaml'
MESSAGES = YAML.load_file('loan_calc_messages.yml')

# begin definitions
def prompt(key)
  puts "=> #{MESSAGES[key]}"
end

def valid_float?(string) # true if string represents a valid float
  string.to_f.to_s == string
end

def valid_integer?(string) # true if float represesnts a valid integer
  string.to_i.to_s == string
end

def valid_change?(string) # true if string includes two decimal places
  string.prepend('0') if string.start_with?('.')
  string.split('.').last.length == 2
end

def no_pennies?(string) # true if string ends with a zero
  string.chars.last == '0'
end

def loose_the_zero(string) # for eliminating a zero in the second decimal place
  penniless_amount = string.chars
  penniless_amount.pop
  penniless_amount.join
end

def valid_float_with_zero?(string) # validates a float that ends with a zero
  string.to_f.to_s == loose_the_zero(string)
end

def good_cents_float?(string) # validates a float
  valid_change?(string) &&
    (valid_float?(string) || valid_float_with_zero?(string))
end

def add_s(string) # returns an 's' if plural
  string.to_i == 1 ? '' : 's'
end

def round(number) # rounds to two decimal places
  format('%.2f', number)
end

def get_loan_amount # gets amount of loan, returns as string
  loop do
    loan_amount = gets.chomp
    if loan_amount.to_f < 0
      prompt('positive')

    elsif loan_amount.include?('.')
      return loan_amount if good_cents_float?(loan_amount)
      prompt('two_decimals')

    elsif valid_integer?(loan_amount)
      return loan_amount

    else
      prompt('valid_amount')
      prompt('example_amount')
    end
  end
end

def get_apr # gets the yearly rate, returns as string
  loop do
    apr = gets.chomp

    if apr.to_f <= 0
      prompt('require_positive')

    elsif valid_float?(apr) || valid_integer?(apr)
      return apr

    else
      prompt('valid_apr')

    end
  end
end

def get_years # gets years in duration, returns array
  loop do
    years = gets.chomp

    if valid_integer?(years) && years.to_i >= 0
      return years

    else
      prompt('valid_years')

    end
  end
end

def get_months
  loop do
    months = gets.chomp

    if months.to_i.between?(0, 11) && valid_integer?(months)
      return months

    else
      prompt('valid_months')

    end
  end
end

def get_duration # gets loan duration, returns array
  loop do
    prompt('years')
    years = get_years

    prompt('months')
    months = get_months

    total_months = (years.to_i * 12) + months.to_i

    return [total_months, years, months] if total_months > 0

    prompt('month_or_more')
  end
end

def display_info(loan_info) # displays loan info from hash
  puts ''

  loan_info.each do |key, value|
    puts "#{key}: #{value}"
  end

  puts ''
end

def yes_or_no # for starting over depending on user response
  loop do
    yes_or_no = gets.chomp.downcase

    if yes_or_no == 'y' || yes_or_no == 'yes'
      return false

    elsif yes_or_no == 'n' || yes_or_no == 'no'
      system('clear')
      prompt('restart')
      return true

    else
      prompt('y_or_n')

    end
  end
end

def calculate_payment(amount, apr, months) # calculates and rounds off payment
  rate = (apr.to_f / 12) / 100

  payment = amount.to_f *
            (rate /
            (1 - (1 + rate)**(-months)))

  round(payment)
end
# end definitions

# begin program
system('clear')

prompt('welcome')

loop do # main loop
  puts ''
  prompt('info')

  # get the loan amount
  prompt('amount')
  amount = get_loan_amount

  # get the apr
  prompt('apr')
  prompt('apr_example')
  apr = get_apr

  # get the duration
  prompt('duration')
  total_months, years, months = get_duration

  # store loan info in a hash
  loan_info = {
    '   Amount' => "$#{amount}",
    '      APR' => "#{apr}%",
    'Durantion' => "#{years} year#{add_s(years)},"\
                   " #{months} month#{add_s(months)}"
  }

  system('clear')

  # verify the loan info
  prompt('verify')
  display_info(loan_info)
  prompt('correct')

  start_over = yes_or_no
  next if start_over

  # calculate the monthly payment
  prompt('calculating')
  monthly_payment = calculate_payment(amount, apr, total_months)

  puts ''
  puts "=> Your monthly payment is $#{monthly_payment}"
  puts ''

  # ask user to exit, or calculate again
  prompt('exit')

  start_over = yes_or_no
  break unless start_over
end

system('clear')

prompt('thank_you')
# end program

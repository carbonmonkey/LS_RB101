require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')
LANG = 'en'

def prompt(key, string = '')
  message = MESSAGES[LANG][key] + string
  Kernel.puts("=> #{message}")
end

def integer?(num)
  num.to_i.to_s == num
end

def float?(num)
  num.to_f.to_s == num
end

def valid_number?(num)
  integer?(num) || float?(num)
end

def string_to_number(num) # returns either integer or float based on string
  integer?(num) ? num.to_i : num.to_f
end

def operation_to_message(op)
  message = case op
            when '1'
              MESSAGES[LANG]['plus']
            when '2'
              MESSAGES[LANG]['minus']
            when '3'
              MESSAGES[LANG]['times']
            when '4'
              MESSAGES[LANG]['divide']
            end

  Kernel.puts("=> #{message} #{MESSAGES[LANG]['two_nums']}")

  message
end

Kernel.system('clear')

prompt('welcome')

name = ''
loop do
  name = Kernel.gets().chomp()

  if name.empty?()
    prompt('valid_name')
  else
    break
  end
end

prompt('hi', name + '!')

loop do # main loop
  number1 = ''
  loop do # get the first number
    prompt('first_num')
    number1 = Kernel.gets().chomp()

    if valid_number?(number1)
      number1 = string_to_number(number1)
      break
    else
      prompt('valid_num')
    end
  end

  number2 = ''
  loop do # get the second number
    prompt('second_num')
    number2 = Kernel.gets().chomp()

    if valid_number?(number2)
      number2 = string_to_number(number2)
      break
    else
      prompt('valid_num')
    end
  end

  prompt('choose_op')

  start_over = false
  operator = ''
  loop do # choose the operation
    operator = Kernel.gets().chomp()

    if %w(1 2 3).include?(operator)
      break
    elsif operator == '4'
      break if number2.to_f != 0.0 # breaks if user divides by valid number

      prompt('div_by_zero')
      prompt('new_nums')
      start_over = true
      break
    else
      prompt('valid_op')
    end
  end

  next if start_over # starts over if user divides by zero

  operation_to_message(operator)

  result = case operator # perform the operation
           when '1'
             number1 + number2
           when '2'
             number1 - number2
           when '3'
             number1 * number2
           when '4'
             number1 / number2.to_f()
           end

  prompt('result', result.to_s)

  prompt('again')
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y', 's')

  Kernel.system('clear')
end

prompt('buh_bye')

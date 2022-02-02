require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')
LANG = 'en'

def fetch_message(key)
  MESSAGES[LANG][key]
end

def prompt(key, post_message = '', pre_message = '')
  message = pre_message + fetch_message(key) + post_message
  Kernel.puts("=> #{message}")
end

def integer?(num)
  num.to_i().to_s() == num
end

def float?(num)
  num.to_f().to_s() == num
end

def valid_number?(num)
  integer?(num) || float?(num)
end

def string_to_number(num) # returns either integer or float based on string
  integer?(num) ? num.to_i() : num.to_f()
end

def get_input
  Kernel.gets().chomp()
end

def get_name
  loop do
    name = get_input()

    if name.empty?()
      prompt('valid_name')
    else
      return(name)
    end
  end
end

def get_numbers
  numbers = []
  loop do
    numbers.empty?() ? prompt('first_num') : prompt('second_num')
    number = get_input()

    if valid_number?(number)
      numbers.push(string_to_number(number))
      return(numbers) if numbers.length() == 2
    else
      prompt('valid_num')
    end
  end
end

def choose_operation(second_num)
  loop do
    operation = get_input()

    if operation == '4' && second_num.to_f() == 0.0 # if user divides by zero
      prompt('div_by_zero')
      prompt('new_nums')
      return('start over')
    elsif %w(1 2 3 4).include?(operation)
      return(operation)
    else # user doesnt' choose a valid operation
      prompt('valid_op')
    end
  end
end

def operation_to_message(op)
  message = case op
            when '1'
              fetch_message('plus')
            when '2'
              fetch_message('minus')
            when '3'
              fetch_message('times')
            when '4'
              fetch_message('divide')
            end

  prompt('two_nums', '', message)

  message
end

def do_the_math(operation, numbers)
  number1, number2 = numbers
  result = case operation
           when '1'
             number1 + number2
           when '2'
             number1 - number2
           when '3'
             number1 * number2
           when '4'
             number1 / number2.to_f()
           end

  result.to_s()
end

def go_again?
  answer = get_input.downcase()
  answer.start_with?('y', 's')
end

Kernel.system('clear')

prompt('welcome')

name = get_name()

prompt('hi', name + '!')

loop do # main loop
  numbers = get_numbers()

  prompt('choose_op')

  operation = choose_operation(numbers.last())

  next if operation == 'start over' # starts over if user divides by zero

  operation_to_message(operation)

  calculation = do_the_math(operation, numbers)

  prompt('result', calculation)

  prompt('again')

  break unless go_again?()

  Kernel.system('clear')
end

prompt('buh_bye')

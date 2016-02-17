# ask the user for a loan amount, APR, and loan duration
require 'yaml'
MESSAGES = YAML.load_file('loan_calculator_messages.yml')

def prompt(message)
  puts("=> #{message}")
end

prompt(MESSAGES['welcome'])

loop do # main loop
  loan_amount = ''
  loop do
    prompt(MESSAGES['loan_amount'])
    loan_amount = Kernel.gets().chomp()
    
    if loan_amount.empty? || loan_amount.to_f < 0 || loan_amount.to_i == 0 || loan_amount.to_f == 0.0
      prompt(MESSAGES['valid_number'])
    else
      break
    end
  end
  
  apr = ''
  loop do
    prompt(MESSAGES['apr'])
    prompt(MESSAGES['apr_example'])
    apr = Kernel.gets().chomp()
    
    if apr.empty? || apr.to_f < 0 || apr.to_i == 0 || apr.to_f == 0.0
    else
      break
    end
  end
  
  months = ''
  loop do
    prompt(MESSAGES['years'])
    months = Kernel.gets().chomp()
    
    if months.empty? || months.to_f < 0 || months.to_i == 0
      prompt(MESSAGES['valid_number'])
    else
      break
    end
  end
  
  annual_interest_rate = apr.to_f / 100
  monthly_interest_rate = annual_interest_rate / 12
  
  monthly_payment = loan_amount.to_f * (monthly_interest_rate / (1 - (1 + monthly_interest_rate)**-months.to_i))
  prompt("Your monthly payment is $#{format('%0.2f', monthly_payment)}")
  
  prompt(MESSAGES['another_calculation'])
  answer = Kernel.gets().chomp()
  break unless answer.downcase.start_with?('y')
  
end # end main loop

prompt(MESSAGES['goodbye'])
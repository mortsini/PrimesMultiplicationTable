=begin
  * Name: PrimesMultiplicationTable
  * Description   
		Ruby code to print a multiplication table of a specified number of primes
  * Author: Xiao
  * Date: August 19, 2014
  * License: Free
=end
def check_convert_int(num)
	error = nil
	if num.length == 0
		error = "No number specified."
	else
		begin # Chose not to use .to_i function to avoid undesired string conversions
			num = Integer(num)
			if num <= 0
				error = "Input #{num} is a non-positive integer."
			end
		rescue
			error = "Input #{num} is a non-integer."
		end
	end
	if error == nil
		return num
	else
		puts error
		puts "Defaulting number of primes to 10."
		return 10
	end
end
def output_prime_result_message(num)
	if num == 1
		puts "The multiplication table of the first prime:"
	else
		puts "The multiplication table of the first #{num} primes:"
	end
end
@@max_num_length = 1
def offset_space_block(s)
		return " " * (@@max_num_length - s.to_s.length)
end

puts "This program prints a multiplication table of primes."
puts "How many primes do you want to use? (Default is 10.)"
num_primes = check_convert_int(gets.chomp)
remaining_primes = num_primes
prime_iterator = 2
known_primes = Array.new()

if remaining_primes > 0 # 2
	known_primes.push(prime_iterator)
	remaining_primes = remaining_primes - 1
	prime_iterator = prime_iterator + 1
end

while remaining_primes > 0
	is_prime = true
	known_primes.each do |prime|
		if prime_iterator % prime == 0 # is not prime
			is_prime = false
			break
		end
	end
	if is_prime
		known_primes.push(prime_iterator)
		remaining_primes = remaining_primes - 1
	end
	prime_iterator = prime_iterator + 2 # 2 is the only even prime, halve the performance time
end

output_prime_result_message(num_primes)
# Set table's maximal element's length for offset calculation
@@max_num_length = (known_primes[num_primes-1] ** 2).to_s.length

# Primes compose the table's columns' headers
print "#{offset_space_block(nil)} "
for i in 0..num_primes-1
	num = known_primes[i]
	print "#{offset_space_block(num)} #{num}"
end
print "\n"
# Print the table
for i in 0..num_primes-1
	num_i = known_primes[i] # Row header
	print "#{offset_space_block(num_i)} #{num_i}"
	for j in 0..num_primes-1
		num = num_i * known_primes[j]
		print "#{offset_space_block(num)} #{num}"
	end
	print "\n"
end



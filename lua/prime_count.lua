--埃拉托色尼筛选法 统计n以内的质数的个数(包括n在内)
function prime_count( n )
	if n < 2 then 
		return 0
	end
	count = n-1
	exist = true
	not_exist = false
	arr = { }
	i = n
	while i > 0  do
		table.insert(arr, 1, exist)
		i = i-1
	end
	arr[1] = not_exist

	i = 2
	while i*i <= n do
		if arr[i]==exist then
			j = i*i
			while j <= n do
				if arr[j]==exist then
					arr[j]=not_exist
					count = count-1
				end
				j=j+i
			end
		end
		i = i+1
	end
	return count
end 

print (prime_count (100))

Fraction = {numerator,denominator}

function Fraction:new (o,numerator,denominator)
	if denominator == 0 then		--分母为0报错
		print ("Initializing fail, denominator can not be 0 !!!")
		return -1
	end
	o = o or {}
	setmetatable(o, self)
	self.__index = self
	o.numerator = numerator or 1
	o.denominator = denominator or 1
	o:reduce()
	return o
end

--化简分数,用辗转相除法
function Fraction:reduce()
	b=self.numerator
	r=self.denominator
	repeat 
		a=b
		b=r
		r=a%b
	until r==0
	self.numerator=self.numerator/b
	self.denominator=self.denominator/b
end

--重载加法
Fraction.__add = function(f1, f2)
		local temp = Fraction:new(nil)
		temp.numerator = f1.numerator*f2.denominator + f2.numerator*f1.denominator
		temp.denominator = f1.denominator*f2.denominator
		temp:reduce()
		return temp
	end

--重载减法
Fraction.__sub = function(f1, f2)
		local temp = Fraction:new(nil)
		temp.numerator = f1.numerator*f2.denominator - f2.numerator*f1.denominator
		temp.denominator = f1.denominator*f2.denominator
		temp:reduce()
		return temp
	end

--重载乘法
Fraction.__mul = function(f1, f2)
		local temp = Fraction:new(nil)
		temp.numerator = f1.numerator*f2.numerator
		temp.denominator = f1.denominator*f2.denominator
		temp:reduce()
		return temp
	end

--重载除法
Fraction.__div = function(f1, f2)
		if f2.numerator == 0 then		--除数为0报错
			print ("Dividing fail, divisor can not be 0 !!!")
			return -1
		end
		local temp = Fraction:new(nil)
		temp.numerator = f1.numerator*f2.denominator
		temp.denominator = f2.numerator*f1.denominator
		temp:reduce()
		return temp
	end

--打印分数
function Fraction:printFraction ()
	print(math.floor(self.numerator).."/"..math.floor(self.denominator))
	--用math.floor()使输出不带小数，如：5.0输出为5
end

--=====================================================================================

--创建分数对象
myfraction1 = Fraction:new(nil,182,220)
myfraction2 = Fraction:new(nil,11,-2)

--打印化简后的两个分数
io.write("reduced fraction1: ")
myfraction1:printFraction()
io.write("reduced fraction2: ")
myfraction2:printFraction()
print()

--相加
add = myfraction1 + myfraction2
io.write("add: ")
add:printFraction()

--相减
sub = myfraction1 - myfraction2
io.write("sub: ")
sub:printFraction()

--相乘
mul = myfraction1 * myfraction2
io.write("mul: " )
mul:printFraction()

--相除
div = myfraction1 / myfraction2
io.write("div: " )
div:printFraction()
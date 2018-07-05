Fraction = {numerator,denominator}

function Fraction:new (o,numerator,denominator)
	if denominator == 0 then		--��ĸΪ0����
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

--�������,��շת�����
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

--���ؼӷ�
Fraction.__add = function(f1, f2)
		local temp = Fraction:new(nil)
		temp.numerator = f1.numerator*f2.denominator + f2.numerator*f1.denominator
		temp.denominator = f1.denominator*f2.denominator
		temp:reduce()
		return temp
	end

--���ؼ���
Fraction.__sub = function(f1, f2)
		local temp = Fraction:new(nil)
		temp.numerator = f1.numerator*f2.denominator - f2.numerator*f1.denominator
		temp.denominator = f1.denominator*f2.denominator
		temp:reduce()
		return temp
	end

--���س˷�
Fraction.__mul = function(f1, f2)
		local temp = Fraction:new(nil)
		temp.numerator = f1.numerator*f2.numerator
		temp.denominator = f1.denominator*f2.denominator
		temp:reduce()
		return temp
	end

--���س���
Fraction.__div = function(f1, f2)
		if f2.numerator == 0 then		--����Ϊ0����
			print ("Dividing fail, divisor can not be 0 !!!")
			return -1
		end
		local temp = Fraction:new(nil)
		temp.numerator = f1.numerator*f2.denominator
		temp.denominator = f2.numerator*f1.denominator
		temp:reduce()
		return temp
	end

--��ӡ����
function Fraction:printFraction ()
	print(math.floor(self.numerator).."/"..math.floor(self.denominator))
	--��math.floor()ʹ�������С�����磺5.0���Ϊ5
end

--=====================================================================================

--������������
myfraction1 = Fraction:new(nil,182,220)
myfraction2 = Fraction:new(nil,11,-2)

--��ӡ��������������
io.write("reduced fraction1: ")
myfraction1:printFraction()
io.write("reduced fraction2: ")
myfraction2:printFraction()
print()

--���
add = myfraction1 + myfraction2
io.write("add: ")
add:printFraction()

--���
sub = myfraction1 - myfraction2
io.write("sub: ")
sub:printFraction()

--���
mul = myfraction1 * myfraction2
io.write("mul: " )
mul:printFraction()

--���
div = myfraction1 / myfraction2
io.write("div: " )
div:printFraction()
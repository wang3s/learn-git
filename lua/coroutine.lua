local newProductor

function productor()
     local i = 0
     while true do
          i = i + 1
          send(i)     -- ����������Ʒ���͸�������
     end
end

function consumer()
     while true do
          local i = receive()     -- ������������õ���Ʒ
          print(i)
     end
end

function receive()
     local status, value = coroutine.resume(newProductor)
     return value
end

function send(x)
     coroutine.yield(x)     -- x��ʾ��Ҫ���͵�ֵ��ֵ�����Ժ󣬾͹����Эͬ����
end

-- ��������
newProductor = coroutine.create(productor)
consumer()

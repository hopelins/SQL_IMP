alter procedure loop99 @x int, @y int
as
begin
	declare @i int, @j int, @str varchar(100)
	set @i = 1
	set @j = 1
	set @str =''
	select @i ,@j,@str

	while (@i <=@x)
		begin 
		while(@j <=@y)
			begin
					--set @str = @str+  ' '+ cast(@i as varchar(2))+'*'+cast(@j as varchar(2)) +'=' + cast((@i*@j) as varchar(2))
					set @str += format(@i, '00') +'*'+format(@j, '00')+'=' +format((@i*@j),'00')+' '
					set @j =@j +1
			end
			
			print @str
			set @j = 1
			set @str =''
			set @i = @i +1
		end

end
go

exec loop99 8, 5

 -- sp

create procedure gen_seat @v_ptime as varchar(40) ,@v_movie as int, @v_roomid as varchar(10)
 as 
 begin  --begin stored procedure

 --declare
declare @v_col int, @v_row int
declare @x_row int, @x_col int

--set
set @x_row = 1
set @x_col = 1

--set @v_row, @v_col
select @v_row= seat_row, @v_col = seat_col 
from m_room
where roomid =  @v_roomid
print cast(@v_row as varchar(2))+' ,'+cast(@v_col as varchar(2))


--insert
while(@x_row<=@v_row)
	begin
		while(@x_col <= @v_col)
			begin			 
				insert into seats (ptime,movie,seat_num,sold,ordid) 
				values (@v_ptime,@v_movie, format(@x_row,'00')+'-'+format(@x_col, '00'), '0', null)
				set @x_col = @x_col+1
			end  -- end while(@x_col <= @v_col)

		set @x_col =1
		set @x_row = @x_row +1

	end       --end while(@x_row<=@v_row)

end -- end stored procedure
go


 -- execute
 exec  gen_seat  '2016-12-25 13:00', 5, 'AÆU'
 go

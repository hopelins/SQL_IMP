use SQLIMPDB01
go

  --declare
declare @v_ptime datetime, @v_movie int, @v_roomid varchar(10)
declare @v_col int, @v_row int
declare @x_row int, @x_col int

--set
set @v_ptime = '2016-12-25 13:00'
set @v_movie =1
set @v_roomid= 'AÆU'
set @x_row = 1
set @x_col = 1

--set @v_row, @v_col
select @v_row= seat_row, @v_col = seat_col 
from m_room
where roomid =  @v_roomid
print cast(@v_row as varchar(2))+' ,'+cast(@v_col as varchar(2))

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


 -- trigger
 create trigger trig_seats_t1 on playlist
 after insert
 as
 begin-- begin trigger

 --declare
 declare @v_ptime varchar(40)
 declare @v_movie int
 declare @v_roomid varchar(10)
declare @v_col int, @v_row int
declare @x_row int, @x_col int

--set from inserted
 SELECT @v_ptime = ptime, @v_movie = movie, @v_roomid =roomid
 FROM   inserted;

 -- execute
 exec gen_seat @v_ptime, @v_movie, @v_roomid

end -- end trigger
go

insert into playlist values('2018-12-31',3)

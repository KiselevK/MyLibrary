
select book_name_ru, series_name_ru, author_name_ru 
from Books as B
	join Series as S
	on B.id_series = S.id_series
	join Author as A
	on B.id_author = A.id_author
order by S.id_series
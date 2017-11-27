use MyLibrary

select series_name_ru, author_name_ru, count(*) as 'book count'
from Books, Author, Series
where Books.id_author = Author.id_author and Books.id_series = Series.id_series
group by series_name_ru, author_name_ru
order by [book count]desc 
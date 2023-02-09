SELECT `Дата заключения договора` "Поколение",
       COUNT(`id договора`) "Кол-во Договоров",
       SUM(CASE WHEN `Задолженность 90+` <> 0 THEN 1 ELSE 0 END) "Кол-во 90+",
       (SUM(CASE WHEN `Задолженность 90+` <> 0 THEN 1 ELSE 0 END)/COUNT(`id договора`)) "% Дефолтов",
       ROW_NUMBER() OVER (ORDER BY `Дата заключения договора` DESC) "Номер"
FROM table_vintaj
GROUP BY `Дата заключения договора`
ORDER BY `Дата заключения договора`;
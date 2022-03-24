SELECT * FROM man;

SELECT man_no manNo, man_name manName, create_date createDate
FROM man
ORDER BY create_Date DESC 
LIMIT 0, 10;

-- manList.jsp
-- SELECT man_no manNo, man_name manName, create_date createDate
-- FROM man
-- ORDER BY create_Date DESC 
-- LIMIT ?, ?;

SELECT COUNT(*) FROM man; -- 전체 행의 개수


SELECT man_no manNo, man_name manName, man_addr manAddr, create_date createDate
FROM man
WHERE man_no = 1;
-- manOne.jsp
-- SELECT man_no manNo, man_name manName, man_addr manAddr, create_date createDate
-- FROM man
-- WHERE man_no = ?;

-- eclipse project name : homework
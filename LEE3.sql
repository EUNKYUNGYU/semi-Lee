SELECT *
		 		FROM(
					SELECT ROWNUM RNUM, A.*
			  			FROM(
		                    SELECT    
		                             BOARD_NO
                                     , BOARD_TYPE
                                     , NICKNAME
                                     , BOARD_TITLE
                                     , BOARD_CONTENT
                                     , TO_CHAR(B.CREATE_DATE,'YYYY/MM/DD')CREATE_DATE
                                     , VIEWS
                                     , B.STATUS
                                 
		                      FROM 
		                             TB_BOARD B
		                     JOIN 
		                             TB_MEMBER ON(WRITER = MEM_NO)
		                        JOIN 
		                             TB_BOARD_TYPE USING(BOARD_TYPE)
		                        WHERE
		                             B.STATUS = 'Y'
		                     	AND  BOARD_TYPE = 10
                                ORDER BY 
                                    B.CREATE_DATE DESC 
					) A ) 
					WHERE  
                        RNUM BETWEEN 1 AND 15;
                        
                        
                        
SELECT COUNT(*) FROM TB_LIKE WHERE BOARD_NO = 1 GROUP BY BOARD_NO;

-- 좋아요 한 게시글 모아보기 --
SELECT *
		 		FROM(
					SELECT ROWNUM RNUM, A.*
			  			FROM(
		                    SELECT    
		                             BOARD_NO
                                     , BOARD_TYPE
                                     , NICKNAME
                                     , BOARD_TITLE
                                     , BOARD_CONTENT
                                     , TO_CHAR(B.CREATE_DATE,'YYYY/MM/DD')CREATE_DATE
                                     , VIEWS
                                     , B.STATUS
                                     , C.*
		                      FROM 
                                  TB_BOARD B
                                  ,(SELECT BOARD_NO, COUNT(MEM_NO) 
                                    FROM TB_LIKE L
                                    RIGHT JOIN TB_BOARD USING(BOARD_NO)
                                    GROUP BY BOARD_NO) C
                                    , TB_MEMBER M
                            WHERE TB_BOARD.WRITER = TB_MEMBER.MEM_NO
                            AND TB_BOARD.BOARD_TYPE = TB_BOARD_TYPE.BOARD_TYPE
                            AND
                                B.STATUS = 'Y'
                    
                            ORDER BY 
                                    B.CREATE_DATE DESC 
					) A ) 
					WHERE  
                        RNUM BETWEEN 1 AND 15;
                        
                        
SELECT *
		 		FROM(
					SELECT ROWNUM RNUM, A.*
			  			FROM(
		                    SELECT    
		                             BOARD_NO
                                     , BOARD_TYPE
                                     , NICKNAME
                                     , BOARD_TITLE
                                     , BOARD_CONTENT
                                     , TO_CHAR(B.CREATE_DATE,'YYYY/MM/DD')CREATE_DATE
                                     , VIEWS
                                     , B.STATUS
                                      , C.*
                                     
		                      FROM 
		                             TB_BOARD B
                                     ,(SELECT BOARD_NO, COUNT(MEM_NO) 
                                    FROM TB_LIKE L
                                    RIGHT JOIN TB_BOARD USING(BOARD_NO)
                                    GROUP BY BOARD_NO) C
                                    , TB_MEMBER M
                                    , TB_BOARD_TYPE T
                                    
                                    
                                WHERE  
		                             B.WRITER = M.MEM_NO
		                        AND 
		                             T.BOARD_TYPE = B.BOARD_TYPE
		                        AND
		                             B.STATUS = 'Y'
		                     	AND  B.BOARD_TYPE = 10
                                ORDER BY 
                                    B.CREATE_DATE DESC 
					) A ) 
					WHERE  
                        RNUM BETWEEN 1 AND 15;
DELETE TB_QUIZE_CHOICE;
COMMIT;



                        
SELECT * FROM vgb.seats;
SELECT * FROM vgb.seats 
WHERE (session_date = '2023-03-02' AND session_time = '13:20' AND session_thread = '1');
/*庫存管理*/
UPDATE seats SET 
A = A|1, B = B|2, C = C|3, D = D|0, 
E = E|0, F = F|0, G = G|0, H = H|0, I = I|0
WHERE A<=1023 AND B<=1023 AND C<=1023 AND D<=1023 AND 
E<=1023 AND F<=1023 AND G<=1023 AND H<=1023 AND I<=1023 AND
((A&1)=0) AND ((B&2)=0) AND ((C&3)=0) AND ((D&0)=0) AND 
((E&0)=0) AND ((F&0)=0) AND ((G&0)=0) AND ((H&0)=0) AND ((I&0)=0) AND 
(session_date = '2023-03-02' AND session_time = '13:20' AND session_thread = '1')
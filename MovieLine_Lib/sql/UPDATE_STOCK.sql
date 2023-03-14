UPDATE seats SET A = A|4
WHERE A<=1023 AND ((A&4)=0) AND session_id ='32'
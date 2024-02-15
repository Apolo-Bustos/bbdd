/* A */
/*
SELECT *
FROM states;

/* B */
/*
SELECT *
FROM provinces;

/* C */ 
/*
SELECT *
FROM locations;

/* D */ 
/*
SELECT *
FROM states
ORDER BY name;

/* E */ 

SELECT prv_name
FROM provinces
ORDER BY prv_stt_code, prv_name;

/* F */ 

SELECT loc_name
FROM locations
order by loc_prv_code, loc_name;

/* G */

SELECT prv_name
FROM provinces
ORDER BY prv_stt_code DESC;

/* H */ 

SELECT stt_name
FROM states
WHERE stt_name LIKE 'A%';

/* I */

SELECT stt_name
FROM states
WHERE stt_name LIKE '%a';

/* J */

SELECT stt_name
FROM states
WHERE stt_name LIKE '%castilla%';

/* k */

SELECT stt_name 
from states
where stt_name like '01' or '02' or '03';

/* N */

select prv_name, stt_name
from provinces
inner join states 
ON provinces.prv_stt_code = states.stt_code;

/* M */










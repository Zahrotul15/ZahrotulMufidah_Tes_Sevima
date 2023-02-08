SELECT 
tbl_mhs.Nim,
tbl_mhs.Nama,
MAX(`tbl_nilai`.`Nilai_Angka`) AS 'Nilai Tertinggi',
MIN(tbl_nilai.Nilai_Angka) AS 'Nilai Terendah' ,
CAST(AVG(tbl_nilai.Nilai_Angka) AS DECIMAL(5,1)) AS 'Rata-rata',
COUNT(tbl_nilai.Kode_Mk) AS 'Jumlah MK',
SUM(CASE 
WHEN tbl_nilai.Nilai_Huruf = 'A' THEN 4 > 1 = 1
WHEN tbl_nilai.Nilai_Huruf = 'B' THEN 3 > 1 = 1
WHEN tbl_nilai.Nilai_Huruf = 'C' THEN 2 > 1 = 1
WHEN tbl_nilai.Nilai_Huruf = 'D' THEN 1 > 1 = 1
WHEN tbl_nilai.Nilai_Huruf = 'E' THEN 0 > 1 = 1
END) AS 'Jumlah MK Lulus',
CAST(SUM(CASE
WHEN `tbl_nilai`.`Nilai_Huruf`= 'A' THEN 4*tbl_nilai.SKS
WHEN `tbl_nilai`.`Nilai_Huruf`= 'B' THEN 3*tbl_nilai.SKS
WHEN `tbl_nilai`.`Nilai_Huruf`= 'C' THEN 2*tbl_nilai.SKS
WHEN `tbl_nilai`.`Nilai_Huruf`= 'D' THEN 1*tbl_nilai.SKS
WHEN `tbl_nilai`.`Nilai_Huruf`= 'E' THEN 0*tbl_nilai.SKS
END)/SUM(tbl_nilai.SKS) AS DECIMAL(5,2))
AS IPK
FROM `tbl_mhs`,`tbl_nilai`
WHERE `tbl_mhs`.`Nim` = `tbl_nilai`.`Nim`
GROUP BY `tbl_nilai`.`Nim`;
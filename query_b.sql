SELECT m.Kode_Mk, m.Nama_Mk, 
       (SELECT COUNT(*) 
        FROM `tbl_nilai` n 
        WHERE n.Kode_Mk = m.Kode_Mk 
        AND (n.Nilai_Huruf = 'A' OR n.Nilai_Huruf = 'B')) AS jumlah_mahasiswa_A_atau_B, 
       (SELECT AVG(n.Nilai_Angka) 
            FROM `tbl_nilai` n 
            INNER JOIN `tbl_mhs` m2 ON n.Nim = m2.Nim 
        WHERE n.Kode_Mk = m.Kode_Mk 
        AND m2.Umur > 20 AND m2.Umur < 22) AS nilai_rata_rata_mahasiswa_umur_20_22
FROM `tbl_nilai` m
WHERE kode_mk IN ('MKA', 'MKC')
GROUP BY m.Kode_Mk;
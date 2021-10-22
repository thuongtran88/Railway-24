CREATE DATABASE IF NOT EXISTS Thuctap;

	CREATE TABLE IF NOT EXISTS Khoa 
    (
			makhoa		CHAR(10),
            tenkhoa		CHAR(30),
            Dienthoai	CHAR(10) );
            
    	CREATE TABLE IF NOT EXISTS GiangVien
	(		magv		INT,
			hotengv 	CHAR(30),
            luong  		DECIMAL(5,2),
            namsinh		INT,
            quequan 	CHAR(30));
            
		CREATE TABLE IF NOT EXISTS Sinhvien
	(
			masv 		INT,
            hotensv  	CHAR(30),
            makhoa		CHAR(30),
            namsinh 	INT,
			quequan		CHAR(30)) ;
            
            CREATE TABLE IF NOT EXISTS Detai
	( 
			madt 		CHAR(10),
            Tendt		CHAR(30),
            Kinhphi		INT,
            Noithuctap	CHAR(30));
            
            CREATE TABLE IF NOT EXISTS Huongdan
	(
			Masv 		INT,
            MaDT 		CHAR(10),
            Magv		INT,
            Ketqua   	DECIMAL(5,2));
            
            

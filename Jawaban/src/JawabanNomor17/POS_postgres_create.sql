CREATE TABLE "public.shift" (
	"shift_id" bigint NOT NULL,
	"hari" char NOT NULL,
	"jam_mulai" char NOT NULL,
	"jam_selesai" char NOT NULL,
	CONSTRAINT "shift_pk" PRIMARY KEY ("shift_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.karyawan" (
	"karyawan_id" serial NOT NULL,
	"nama" char NOT NULL,
	"kontak" int NOT NULL,
	"alamat" char NOT NULL,
	"status" BOOLEAN NOT NULL,
	"tanggal_masuk" DATE NOT NULL,
	"tanggal_keluar" DATE NOT NULL,
	"jenis_kelamin" char NOT NULL,
	"otoritas_id" char NOT NULL,
	CONSTRAINT "karyawan_pk" PRIMARY KEY ("karyawan_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.operasional" (
	"kerja_id" serial NOT NULL,
	"shift_id" bigint NOT NULL,
	"karyawan_id" bigint NOT NULL,
	"tanggal" DATE NOT NULL UNIQUE,
	CONSTRAINT "operasional_pk" PRIMARY KEY ("kerja_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Barang" (
	"barang_id" serial NOT NULL,
	"barcode" bigint NOT NULL UNIQUE,
	"nama_barang" char NOT NULL UNIQUE,
	"kategori_id" bigint NOT NULL UNIQUE,
	"berat" bigint NOT NULL,
	"harga" bigint NOT NULL,
	"tanggal_masuk" DATE NOT NULL,
	"dibuat_oleh" bigint NOT NULL,
	"status" BOOLEAN NOT NULL,
	"stok" int NOT NULL,
	"cabang" bigint NOT NULL,
	"suplier_id" bigint NOT NULL,
	CONSTRAINT "Barang_pk" PRIMARY KEY ("barang_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.kategori" (
	"kategori_id" serial NOT NULL,
	"nama_kategori" char NOT NULL,
	"verifikasi" char NOT NULL,
	CONSTRAINT "kategori_pk" PRIMARY KEY ("kategori_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.cabang" (
	"cabang_id" serial NOT NULL,
	"nama_cabang" char NOT NULL,
	"negara" char NOT NULL,
	"profinsi" char NOT NULL,
	"kabupaten" char NOT NULL,
	"kecamatan" char NOT NULL,
	"jalan" char NOT NULL,
	"kode_pos" int NOT NULL,
	CONSTRAINT "cabang_pk" PRIMARY KEY ("cabang_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.transaksi" (
	"transaksi_id" serial,
	"kategori_transaksi" bigint NOT NULL,
	"status" BOOLEAN NOT NULL,
	"tanggal_pembelian" DATE NOT NULL,
	"alamat_pengiriman" char,
	"dilayani_oleh" bigint NOT NULL,
	"kode_pos" char,
	"barang_id" bigint NOT NULL,
	"kirim_id" bigint NOT NULL,
	"pembayaran_id" bigint NOT NULL,
	"pembeli_id" bigint NOT NULL,
	CONSTRAINT "transaksi_pk" PRIMARY KEY ("transaksi_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.keuangan" (
	"keuangan_id" serial NOT NULL,
	"tgl_keuangan" DATE NOT NULL,
	"tipe_kasir" char NOT NULL,
	"tipe_keuangan" char NOT NULL,
	"keterangan" char NOT NULL,
	"jumlah_rp" bigint NOT NULL,
	"transaksi_id" bigint NOT NULL,
	CONSTRAINT "keuangan_pk" PRIMARY KEY ("keuangan_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.otoritas" (
	"otoritas_id" serial NOT NULL,
	"jenis" char NOT NULL,
	CONSTRAINT "otoritas_pk" PRIMARY KEY ("otoritas_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.pembeli" (
	"pembeli_id" serial NOT NULL,
	"nama" char NOT NULL,
	"kontak" int NOT NULL,
	"email" char NOT NULL,
	"alamat" char NOT NULL,
	"otoritas_id" bigint NOT NULL,
	CONSTRAINT "pembeli_pk" PRIMARY KEY ("pembeli_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.pembayaran" (
	"pembayaran_id" serial NOT NULL,
	"transaksi" bigint NOT NULL,
	"cek_nomor" bigint NOT NULL,
	"tanggal_pembayaran" DATE NOT NULL,
	CONSTRAINT "pembayaran_pk" PRIMARY KEY ("pembayaran_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.kirim" (
	"kirim_id" serial NOT NULL,
	"nama_pengirim" char NOT NULL,
	"nama_perusahaan" char NOT NULL,
	"kontak" int NOT NULL,
	"alamat" char NOT NULL,
	"ongkos_kirim" int NOT NULL,
	"nomor_resi" int NOT NULL UNIQUE,
	"tanggal_kirim" DATE NOT NULL,
	"tanggal_sampai" DATE NOT NULL,
	CONSTRAINT "kirim_pk" PRIMARY KEY ("kirim_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.suplier" (
	"suplier_id" serial NOT NULL,
	"nama_perusahaan" char NOT NULL,
	"nama_kontak" char NOT NULL,
	"kontak_tlep" int NOT NULL,
	"email" char NOT NULL,
	"alamat" char NOT NULL,
	"kota" char NOT NULL,
	"negara" char NOT NULL,
	"kode_pos" char NOT NULL,
	"catatan" char NOT NULL,
	CONSTRAINT "suplier_pk" PRIMARY KEY ("suplier_id")
) WITH (
  OIDS=FALSE
);




ALTER TABLE "karyawan" ADD CONSTRAINT "karyawan_fk0" FOREIGN KEY ("otoritas_id") REFERENCES "otoritas"("otoritas_id");

ALTER TABLE "operasional" ADD CONSTRAINT "operasional_fk0" FOREIGN KEY ("shift_id") REFERENCES "shift"("shift_id");
ALTER TABLE "operasional" ADD CONSTRAINT "operasional_fk1" FOREIGN KEY ("karyawan_id") REFERENCES "karyawan"("karyawan_id");

ALTER TABLE "Barang" ADD CONSTRAINT "Barang_fk0" FOREIGN KEY ("kategori_id") REFERENCES "kategori"("kategori_id");
ALTER TABLE "Barang" ADD CONSTRAINT "Barang_fk1" FOREIGN KEY ("dibuat_oleh") REFERENCES "karyawan"("karyawan_id");
ALTER TABLE "Barang" ADD CONSTRAINT "Barang_fk2" FOREIGN KEY ("cabang") REFERENCES "cabang"("cabang_id");
ALTER TABLE "Barang" ADD CONSTRAINT "Barang_fk3" FOREIGN KEY ("suplier_id") REFERENCES "suplier"("suplier_id");



ALTER TABLE "transaksi" ADD CONSTRAINT "transaksi_fk0" FOREIGN KEY ("dilayani_oleh") REFERENCES "karyawan"("karyawan_id");
ALTER TABLE "transaksi" ADD CONSTRAINT "transaksi_fk1" FOREIGN KEY ("barang_id") REFERENCES "Barang"("barang_id");
ALTER TABLE "transaksi" ADD CONSTRAINT "transaksi_fk2" FOREIGN KEY ("kirim_id") REFERENCES "kirim"("kirim_id");
ALTER TABLE "transaksi" ADD CONSTRAINT "transaksi_fk3" FOREIGN KEY ("pembayaran_id") REFERENCES "pembayaran"("pembayaran_id");
ALTER TABLE "transaksi" ADD CONSTRAINT "transaksi_fk4" FOREIGN KEY ("pembeli_id") REFERENCES "pembeli"("pembeli_id");

ALTER TABLE "keuangan" ADD CONSTRAINT "keuangan_fk0" FOREIGN KEY ("transaksi_id") REFERENCES "transaksi"("transaksi_id");


ALTER TABLE "pembeli" ADD CONSTRAINT "pembeli_fk0" FOREIGN KEY ("otoritas_id") REFERENCES "otoritas"("otoritas_id");


















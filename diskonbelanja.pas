program Projekdiskonbelanja;
uses crt;

type
    TBarang = record
        nama: string;
        harga: longint;
    end;

var
    barang: array[1..5] of TBarang;
    keranjang: array[1..100] of integer;
    jumlahBarang: array[1..100] of integer;
    pilihan, total, jumlahItem, jumlahBeli: longint;
    i: integer;


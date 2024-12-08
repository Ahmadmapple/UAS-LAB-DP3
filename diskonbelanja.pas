program Projekdiskonbelanja;
uses crt;

type
    TBarang = record
        nama: string;
        Jumlah: integer;
        harga: longint;
    end;

var
    Keranjang: array of TBarang;
    jumlahBarang: integer;
    pilihan, total: longint;
    i: integer;

procedure TampilanHasilScan();
begin
    clrscr;
    writeln('________________ Program Belanja & Diskon :v _______________________');
    writeln('Total Harga Belanjaan: ', total);
    writeln('Total Barang Belanjaan: ', jumlahBarang);
    writeln;
    write('Tekan Enter untuk kembali ke menu utama...');
    readln;
end;

procedure TampilanScanBarang();
begin
    clrscr;
    writeln('________________ Program Belanja & Diskon :v _______________________');
    writeln;
    write('Masukkan Jumlah Barang Belanjaan (Input -1 untuk ke menu utama): ');
    readln(jumlahBarang);

    if jumlahBarang = -1 then
        exit;

    setlength(Keranjang, jumlahBarang);
    total := 0;

    for i := 1 to jumlahBarang do
    begin
        writeln('Barang ke-', i);
        write('Masukkan Nama Barang: ');
        readln(Keranjang[i].nama);
        write('Masukkan Jumlah Barang: ');
        readln(Keranjang[i].Jumlah);
        write('Masukkan Harga Barang: ');
        readln(Keranjang[i].harga); 
        total := total + (Keranjang[i].harga * Keranjang[i].Jumlah);
    end;

    TampilanHasilScan();
end;

procedure TampilanRiwayatBelanja();
begin
    clrscr;
    writeln('________________ Program Belanja & Diskon :v _______________________');
    writeln('Riwayat Belanja Anda:');
    writeln;

    if jumlahBarang = 0 then
        writeln('Belum ada barang yang discan.')
    else
    begin
        for i := 1 to jumlahBarang do
        begin
            writeln('Barang ', i , ': ', Keranjang[i].nama, ' - Rp', Keranjang[i].harga);
        end;
        writeln('Total Harga: Rp', total);
    end;

    writeln;
    write('Tekan Enter untuk kembali ke menu utama');
    readln;
end;

begin
    jumlahBarang := 0; 
    total := 0;        
    repeat
        clrscr;
        writeln('________________ Program Belanja & Diskon :v _______________________');
        writeln;
        writeln('1. SCAN BARANG BELANJAAN');
        writeln('2. RIWAYAT BELANJA');
        writeln('3. KELUAR');
        write('Masukkan Pilihan Anda (1-3): ');
        readln(pilihan);

        case pilihan of
            1: TampilanScanBarang();
            2: TampilanRiwayatBelanja();
            3: 
            begin
                writeln('Makasih Telah Menggunakan Program Ini.');
                halt;
            end;
            else
                writeln('Pilihan tidak valid. Tekan Enter untuk mencoba lagi...');
                readln;
        end;
    until pilihan = 3;    
end.

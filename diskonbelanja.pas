program Projekbelanja;
uses crt;

type
    TBarang = record
        nama: string;
        Jumlah: integer;
        harga: longint;
        subtotal: longint;
    end;

var
    Keranjang: array of TBarang;
    jumlahBarang: integer;
    pilihan, total, diskon: longint;
    i: integer;

procedure TampilanHasilScan();
begin
    clrscr;
    clrscr;
    writeln('________________ Program Belanja :v _______________________');
    writeln('Barang yang telah Anda beli:');
    for i := 0 to jumlahBarang - 1 do
    begin
        writeln('Barang ', i + 1, ': ', Keranjang[i].nama, 
                ' - Jumlah: ', Keranjang[i].Jumlah, 
                ' - Harga Satuan: Rp', Keranjang[i].harga,
                ' - Subtotal: Rp', Keranjang[i].subtotal);
    end;
    writeln;

    writeln('Total Harga Belanjaan: Rp ', total);

    if total > 500000 then
    begin
        diskon := total * 15 div 100;
        writeln('Diskon 15%: Rp', diskon);
        writeln('Harga Setelah Diskon: Rp', total - diskon);
    end
    else
    begin
        diskon := 0;
        writeln('Diskon: Tidak ada');
        writeln('Harga Akhir: Rp', total);
    end;

    writeln('Total Barang Belanjaan: ', jumlahBarang);
    writeln;
    write('Tekan Enter untuk kembali ke menu utama...');
    readln;
end;

procedure TampilanScanBarang();
begin
    clrscr;
    writeln('________________ Program Belanja :v _______________________');
    writeln;
    write('Masukkan Jumlah Barang Belanjaan (Input -1 untuk ke menu utama): ');
    readln(jumlahBarang);

    if jumlahBarang = -1 then
        exit;

    setlength(Keranjang, jumlahBarang);
    total := 0;

    for i := 0 to jumlahBarang - 1 do
    begin
        writeln('Barang ke-', i + 1);
        write('Masukkan Nama Barang: ');
        readln(Keranjang[i].nama);
        write('Masukkan Jumlah Barang: ');
        readln(Keranjang[i].Jumlah);
        write('Masukkan Harga Barang: ');
        readln(Keranjang[i].harga);

        // Menghitung subtotal
        Keranjang[i].subtotal := Keranjang[i].harga * Keranjang[i].Jumlah;

        // Menambahkan ke total
        total := total + Keranjang[i].subtotal;
    end;

    // Menampilkan daftar barang yang telah dimasukkan
    clrscr;
    writeln('________________ Program Belanja :v _______________________');
    writeln('Barang yang telah Anda masukkan:');
    for i := 0 to jumlahBarang - 1 do
    begin
        writeln('Barang ', i + 1, ': ', Keranjang[i].nama, 
                ' - Jumlah: ', Keranjang[i].Jumlah, 
                ' - Harga Satuan: Rp', Keranjang[i].harga,
                ' - Subtotal: Rp', Keranjang[i].subtotal);
    end;
    writeln;

    TampilanHasilScan();
end;

procedure TampilanRiwayatBelanja();
begin
    clrscr;
    writeln('________________ Program Belanja :v _______________________');
    writeln('Riwayat Belanja Anda:');
    writeln;

    if jumlahBarang = 0 then
        writeln('Belum ada barang yang discan.')
    else
    begin
        for i := 0 to jumlahBarang - 1 do
        begin
            writeln('Barang ', i + 1 , ': ', Keranjang[i].nama, 
                    ' - Jumlah: ', Keranjang[i].Jumlah, 
                    ' - Harga Satuan: Rp', Keranjang[i].harga,
                    ' - Subtotal: Rp', Keranjang[i].subtotal);
        end;
        writeln;
        writeln('Total Harga: Rp', total);

        
            // Cek apakah mendapatkan diskon
        if total > 500000 then
        begin
            diskon := total * 15 div 100;
            writeln('Diskon 15%: Rp', diskon);
            writeln('Harga Setelah Diskon: Rp', total - diskon);
        end
        else
        begin
            writeln('Diskon: Tidak ada');
            writeln('Harga Akhir: Rp', total);
        end;
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
        writeln('________________ Program Belanja :v _______________________');
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

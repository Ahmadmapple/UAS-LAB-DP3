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
    pilihan, total, diskon15, diskon5, totalDiskon, totalJumlahBarang: longint;
    i: integer;

procedure TampilanHasilScan();
begin
    clrscr;
    writeln('________________ Program Belanja :v _______________________');
    writeln('Barang yang telah Anda beli:');
    totalJumlahBarang := 0;
    for i := 0 to jumlahBarang - 1 do
    begin
        writeln('Barang ', i + 1, ': ', Keranjang[i].nama, 
                ' - Jumlah: ', Keranjang[i].Jumlah, 
                ' - Harga Satuan: Rp', Keranjang[i].harga,
                ' - Subtotal: Rp', Keranjang[i].subtotal);
        totalJumlahBarang := totalJumlahBarang + Keranjang[i].Jumlah;
    end;
    writeln;

    writeln('Total Harga Belanjaan: Rp ', total);

    // Menghitung diskon
    diskon15 := 0;
    diskon5 := 0;

    if total > 500000 then
        diskon15 := total * 15 div 100;
    
    if totalJumlahBarang >= 5 then
        diskon5 := total * 5 div 100;

    totalDiskon := diskon15 + diskon5;

    writeln('Total Diskon: Rp', totalDiskon);
    writeln('Harga Setelah Diskon: Rp', total - totalDiskon);

    writeln('Total Barang Belanjaan: ', totalJumlahBarang);
    writeln;
    write('Tekan Enter untuk kembali ke menu utama...');
    readln;
end;

procedure TampilanScanBarang();
begin
    clrscr;
    writeln('________________ Program Belanja :v _______________________');
    writeln;
    writeln('Diskon 15% Jika total harga > Rp500.000');
    writeln('Diskon 5% Jika jumlah barang >= 5');
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

        if Keranjang[i].harga < 100 then 
        begin
            write('Mohon Masukkan Harga Barang dengan benar ');
            writeln;
            write('Tekan Enter untuk kembali ke menu utama...');
            readln;
            exit;
        end
        else
        begin
        // Menghitung subtotal
        Keranjang[i].subtotal := Keranjang[i].harga * Keranjang[i].Jumlah;

        // Menambahkan ke total
        total := total + Keranjang[i].subtotal;
        end;
    end;

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
        totalJumlahBarang := 0;
        for i := 0 to jumlahBarang - 1 do
        begin
            writeln('Barang ', i + 1 , ': ', Keranjang[i].nama, 
                    ' - Jumlah: ', Keranjang[i].Jumlah, 
                    ' - Harga Satuan: Rp', Keranjang[i].harga,
                    ' - Subtotal: Rp', Keranjang[i].subtotal);
            totalJumlahBarang := totalJumlahBarang + Keranjang[i].Jumlah;
        end;
        writeln;
        writeln('Total Harga: Rp', total);

        // Menghitung diskon
        diskon15 := 0;
        diskon5 := 0;

        if total > 500000 then
            diskon15 := total * 15 div 100;
        
        if totalJumlahBarang >= 5 then
            diskon5 := total * 5 div 100;

        totalDiskon := diskon15 + diskon5;

        writeln('Diskon 15% (Jika total > Rp500.000): Rp', diskon15);
        writeln('Diskon 5% (Jika jumlah barang >= 5): Rp', diskon5);
        writeln('Total Diskon: Rp', totalDiskon);
        writeln('Harga Setelah Diskon: Rp', total - totalDiskon);
    end;

    writeln;
    write('Tekan Enter untuk kembali ke menu utama...');
    readln;
end;

begin
    jumlahBarang := 0; 
    total := 0;
    totalJumlahBarang := 0;
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

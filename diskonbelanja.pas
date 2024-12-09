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

// Menampilkan hasil scan belanjaan, termasuk diskon dan total harga
procedure TampilanHasilScan();
begin
    clrscr;
    writeln('________________ HASIL SCAN BELANJAAN :v _______________________');
    writeln('Barang yang telah Anda beli:');
    totalJumlahBarang := 0;

   // Header tabel untuk barang
    writeln('------------------------------------------------------------');
    writeln('| No | Nama Barang      | Jumlah | Harga Satuan | Subtotal |');
    writeln('------------------------------------------------------------');

    for i := 0 to jumlahBarang - 1 do
    begin
        writeln('| ', i + 1:2, ' | ', 
                copy(Keranjang[i].nama, 1, 15):15, ' | ', 
                Keranjang[i].Jumlah:6, ' | ', 
                Keranjang[i].harga:12, ' | ', 
                Keranjang[i].subtotal:9, ' |');
        totalJumlahBarang := totalJumlahBarang + Keranjang[i].Jumlah; // Menambah jumlah barang total
    end;

    writeln('------------------------------------------------------------');
    writeln;

    writeln('Total Harga Belanjaan: Rp ', total);

    // Menghitung diskon
    diskon15 := 0;
    diskon5 := 0;

    if total > 500000 then
        diskon15 := total * 15 div 100; // Diskon 15% untuk total harga > Rp500.000
    
    if totalJumlahBarang >= 5 then
        diskon5 := total * 5 div 100; // Diskon 5% untuk jumlah barang >= 5

    totalDiskon := diskon15 + diskon5; // Total semua diskon

    // Header tabel untuk perhitungan diskon
    writeln('------------------------------------------------------------');
    writeln('| Diskon           | Jumlah Diskon | Harga Setelah Diskon |');
    writeln('------------------------------------------------------------');
    writeln('| Diskon 15%       | Rp ', diskon15:12, ' | Rp ', total - diskon15:15, ' |');
    writeln('| Diskon 5%        | Rp ', diskon5:12, ' | Rp ', total - diskon5:15, ' |');
    writeln('------------------------------------------------------------');
    writeln('| Total Diskon     | Rp ', totalDiskon:12, ' | Rp ', total - totalDiskon:15, ' |');
    writeln('------------------------------------------------------------');
    writeln;

    writeln('Total Barang Belanjaan: ', totalJumlahBarang); // Total jumlah barang
    writeln;
    write('Tekan Enter untuk kembali ke menu utama...');
    readln;
end;

// Proses scan barang, termasuk input jumlah, nama, harga, dan validasi harga
procedure TampilanScanBarang();
begin
    clrscr;
    writeln('________________ SCAN BARANG ;v _______________________');
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

    // Validasi harga barang
        if Keranjang[i].harga < 100 then 
        begin
            write('Mohon Masukkan Harga Barang dengan benar ');
            writeln;
            write('Tekan Enter untuk kembali ke menu utama...');
            readln;
            exit; // Keluar jika harga tidak valid
        end
        else
        begin
        // Menghitung subtotal
        Keranjang[i].subtotal := Keranjang[i].harga * Keranjang[i].Jumlah;

        // Menambahkan ke total
        total := total + Keranjang[i].subtotal;
        end;
    end;

    TampilanHasilScan(); // Panggil prosedur untuk menampilkan hasil scan
end;

// Menampilkan riwayat belanja
procedure TampilanRiwayatBelanja();
begin
    clrscr;
    writeln('________________ RIWAYAT BELANJA :v _______________________');
    writeln('Riwayat Belanja Anda:');
    writeln;

    if jumlahBarang = 0 then
        writeln('Belum ada barang yang discan.')
    else
    begin
        totalJumlahBarang := 0;

        // Header tabel untuk barang
        writeln('------------------------------------------------------------');
        writeln('| No | Nama Barang      | Jumlah | Harga Satuan | Subtotal |');
        writeln('------------------------------------------------------------');

        for i := 0 to jumlahBarang - 1 do
        begin
            writeln('| ', i + 1:2, ' | ', 
                    copy(Keranjang[i].nama, 1, 15):15, ' | ', 
                    Keranjang[i].Jumlah:6, ' | ', 
                    Keranjang[i].harga:12, ' | ', 
                    Keranjang[i].subtotal:9, ' |');
            totalJumlahBarang := totalJumlahBarang + Keranjang[i].Jumlah;
        end;

        writeln('------------------------------------------------------------');
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

         // Header tabel untuk perhitungan diskon
        writeln('------------------------------------------------------------');
        writeln('| Diskon           | Jumlah Diskon | Harga Setelah Diskon |');
        writeln('------------------------------------------------------------');
        writeln('| Diskon 15%       | Rp ', diskon15:12, ' | Rp ', total - diskon15:15, ' |');
        writeln('| Diskon 5%        | Rp ', diskon5:12, ' | Rp ', total - diskon5:15, ' |');
        writeln('------------------------------------------------------------');
        writeln('| Total Diskon     | Rp ', totalDiskon:12, ' | Rp ', total - totalDiskon:15, ' |');
        writeln('------------------------------------------------------------');
        writeln;
    end;

    writeln('Total Barang Belanjaan: ', totalJumlahBarang);
    writeln;
    write('Tekan Enter untuk kembali ke menu utama...');
    readln;
end;

// Membersihkan seluruh riwayat belanja
procedure BersihkanRiwayatBelanja();
begin
    jumlahBarang := 0;
    total := 0;
    totalJumlahBarang := 0;
    setlength(Keranjang, 0); // Mengosongkan array
    writeln('Riwayat belanja telah dibersihkan.');
    writeln('Tekan Enter untuk kembali ke menu utama...');
    readln;
end;

begin
    jumlahBarang := 0; 
    total := 0;
    totalJumlahBarang := 0;
    repeat
        clrscr;
        writeln('__________________ SELAMAT DATANG DI AMBAMART _____________________');
        writeln;
        writeln('Apa yang ingin anda lakukan ?');
        writeln('1. SCAN BARANG BELANJAAN');
        writeln('2. RIWAYAT BELANJA');
        writeln('3. BERSIHKAN RIWAYAT BELANJA');
        writeln('4. KELUAR');
        write('Masukkan Pilihan Anda (1-4): ');
        readln(pilihan);

        case pilihan of
            1: TampilanScanBarang();
            2: TampilanRiwayatBelanja();
            3: BersihkanRiwayatBelanja();
            4: 
            begin
                writeln('Terima Kasih Telah Berbelanja di Ambamart.');
                halt;
            end;
            else
                writeln('Pilihan tidak valid. Tekan Enter untuk mencoba lagi...');
                readln;
        end;
    until pilihan = 4;    
end.

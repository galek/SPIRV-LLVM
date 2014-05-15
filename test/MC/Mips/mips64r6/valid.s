# Instructions that are valid
#
# RUN: llvm-mc %s -triple=mips-unknown-linux -show-encoding -mcpu=mips64r6 | FileCheck %s

        .set noat
        # FIXME: Add the instructions carried forward from older ISA's
        addiupc $4, 100          # CHECK: addiupc $4, 100     # encoding: [0xec,0x80,0x00,0x19]
        align   $4, $2, $3, 2    # CHECK: align $4, $2, $3, 2 # encoding: [0x7c,0x43,0x22,0xa0]
        aluipc  $3, 56           # CHECK: aluipc $3, 56       # encoding: [0xec,0x7f,0x00,0x38]
        aui     $3,$2,-23        # CHECK: aui $3, $2, -23     # encoding: [0x3c,0x62,0xff,0xe9]
        auipc   $3, -1           # CHECK: auipc $3, -1        # encoding: [0xec,0x7e,0xff,0xff]
        dalign  $4,$2,$3,5       # CHECK: dalign $4, $2, $3, 5 # encoding: [0x7c,0x43,0x23,0x64]
        daui    $3,$2,0x1234     # CHECK: daui $3, $2, 4660  # encoding: [0x74,0x62,0x12,0x34]
        dahi    $3,$3,0x5678     # CHECK: dahi $3, $3, 22136 # encoding: [0x04,0x66,0x56,0x78]
        dati    $3,$3,0xabcd     # CHECK: dati $3, $3, 43981 # encoding: [0x04,0x7e,0xab,0xcd]
        div     $2,$3,$4         # CHECK: div $2, $3, $4   # encoding: [0x00,0x64,0x10,0x9a]
        divu    $2,$3,$4         # CHECK: divu $2, $3, $4  # encoding: [0x00,0x64,0x10,0x9b]
        mod     $2,$3,$4         # CHECK: mod $2, $3, $4   # encoding: [0x00,0x64,0x10,0xda]
        modu    $2,$3,$4         # CHECK: modu $2, $3, $4  # encoding: [0x00,0x64,0x10,0xdb]
        ddiv    $2,$3,$4         # CHECK: ddiv $2, $3, $4  # encoding: [0x00,0x64,0x10,0x9e]
        ddivu   $2,$3,$4         # CHECK: ddivu $2, $3, $4 # encoding: [0x00,0x64,0x10,0x9f]
        dmod    $2,$3,$4         # CHECK: dmod $2, $3, $4  # encoding: [0x00,0x64,0x10,0xde]
        dmodu   $2,$3,$4         # CHECK: dmodu $2, $3, $4 # encoding: [0x00,0x64,0x10,0xdf]
#        mul     $2,$3,$4         # CHECK-TODO: mul $2, $3, $4   # encoding: [0x00,0x64,0x10,0x98]
        muh     $2,$3,$4         # CHECK: muh $2, $3, $4   # encoding: [0x00,0x64,0x10,0xd8]
        mulu    $2,$3,$4         # CHECK: mulu $2, $3, $4  # encoding: [0x00,0x64,0x10,0x99]
        muhu    $2,$3,$4         # CHECK: muhu $2, $3, $4  # encoding: [0x00,0x64,0x10,0xd9]
        dmul    $2,$3,$4         # CHECK: dmul $2, $3, $4  # encoding: [0x00,0x64,0x10,0xb8]
        dmuh    $2,$3,$4         # CHECK: dmuh $2, $3, $4  # encoding: [0x00,0x64,0x10,0xf8]
        dmulu   $2,$3,$4         # CHECK: dmulu $2, $3, $4 # encoding: [0x00,0x64,0x10,0xb9]
        dmuhu   $2,$3,$4         # CHECK: dmuhu $2, $3, $4 # encoding: [0x00,0x64,0x10,0xf9]
        sel.d   $f0,$f1,$f2      # CHECK: sel.d $f0, $f1, $f2 # encoding: [0x46,0x22,0x08,0x10]
        sel.s   $f0,$f1,$f2      # CHECK: sel.s $f0, $f1, $f2 # encoding: [0x46,0x02,0x08,0x10]

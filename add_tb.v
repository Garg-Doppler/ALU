`timescale 1 ns/1 ps
    `include "alu.v"


    module add_tb ();
        reg clock;
        reg [31:0] a, b;
        reg [2:0] op;
        reg [31:0] correct;

        wire [31:0] out;
        wire [49:0] pro;

        alu U1 (
                .clk(clock),
                .A(a),
                .B(b),
                .OpCode(op),
                .O(out)
            );
        /* create a 10Mhz clock */
        always
        #100 clock = ~clock; // every 100 nanoseconds invert
        initial begin
            $dumpfile("alu_tb.vcd");
            $dumpvars(0,clock, a, b, op, out);
            clock = 0;

    op = 3'b000;

		/* Display the operation */
		$display ("Opcode: 000, Operation: ADD");
		/* Test Cases!*/
		a = 32'b00101000010100011000110010111011;
		b = 32'b10101011100101001000111101000001;
		correct = 32'b10101011100100101110110000101000;
		#400 //1.1632347e-14 * -1.0555793e-12 = -1.043947e-12
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00100110110010101010100101111010;
		b = 32'b01011010010011111010110111000011;
		correct = 32'b01011010010011111010110111000011;
		#400 //1.4062502e-15 * 1.4614093e+16 = 1.4614093e+16
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11111110000111110010101110111010;
		b = 32'b01101000001010110110101101110000;
		correct = 32'b11111110000111110010101110111010;
		#400 //-5.2893573e+37 * 3.2380262e+24 = -5.2893573e+37
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11110010010011000010011010001111;
		b = 32'b10000100010100100001101111100111;
		correct = 32'b11110010010011000010011010001111;
		#400 //-4.0436196e+30 * -2.4698193e-36 = -4.0436196e+30
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00011001101000100010011010110110;
		b = 32'b00010001000101101000011001000111;
		correct = 32'b00011001101000100010011100000001;
		#400 //1.6766043e-23 * 1.1874291e-28 = 1.6766161e-23
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10011000000101101000001011000100;
		b = 32'b11110001100110000000011100001010;
		correct = 32'b11110001100110000000011100001010;
		#400 //-1.9453065e-24 * -1.5056074e+30 = -1.5056074e+30
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11100111100101000010100100100010;
		b = 32'b00011111011011110010100100001100;
		correct = 32'b11100111100101000010100100100010;
		#400 //-1.399338e+24 * 5.0644172e-20 = -1.399338e+24
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11010111111011001101011001001001;
		b = 32'b00010011000001100111000110001001;
		correct = 32'b11010111111011001101011001001001;
		#400 //-520810200000000.0 * 1.6969155e-27 = -520810200000000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10000000101110010101110000101101;
		b = 32'b11000000111000111001111111111111;
		correct = 32'b11000000111000111001111111111111;
		#400 //-1.7022633e-38 * -7.113281 = -7.113281
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01101111000001100000101110111101;
		b = 32'b01111010110011011101000100011101;
		correct = 32'b01111010110011011101000100011110;
		#400 //4.148518e+28 * 5.343311e+35 = 5.3433113e+35
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00011010110001011010000111100011;
		b = 32'b10010100011011110010001001111101;
		correct = 32'b00011010110001011001101001101010;
		#400 //8.173883e-23 * -1.2073218e-26 = 8.172676e-23
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00110000100111001011011000001101;
		b = 32'b01000011000100001001010010100100;
		correct = 32'b01000011000100001001010010100100;
		#400 //1.1402236e-09 * 144.58063 = 144.58063
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00000111110110111100010011000010;
		b = 32'b00110110100001000001010100100100;
		correct = 32'b00110110100001000001010100100100;
		#400 //3.3067101e-34 * 3.9363676e-06 = 3.9363676e-06
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00000000111001001101101110001010;
		b = 32'b00001010010001101011011101000001;
		correct = 32'b00001010010001101011011101011110;
		#400 //2.1017249e-38 * 9.5678195e-33 = 9.567841e-33
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01000101111101110001101101110011;
		b = 32'b11010010011010100111010110111100;
		correct = 32'b11010010011010100111010110111100;
		#400 //7907.431 * -251749400000.0 = -251749400000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00101011001011010011011010010011;
		b = 32'b00001101111001111100001001101110;
		correct = 32'b00101011001011010011011010010011;
		#400 //6.1537684e-13 * 1.4283281e-30 = 6.1537684e-13
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00101000011111111001001010001101;
		b = 32'b00110010100111110101000000011000;
		correct = 32'b00110010100111110101000000100000;
		#400 //1.4187122e-14 * 1.8546459e-08 = 1.8546473e-08
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11010001111001000101011101011010;
		b = 32'b00000110010000101111000110101110;
		correct = 32'b11010001111001000101011101011010;
		#400 //-122589760000.0 * 3.6664903e-35 = -122589760000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01000000010101100011101100010001;
		b = 32'b00000000000000011111000000011111;
		correct = 32'b01000000010101100011101100010001;
		#400 //3.3473551 * 1.77975e-40 = 3.3473551
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01010110000011100011011010010011;
		b = 32'b00011111010101000001001111110010;
		correct = 32'b01010110000011100011011010010011;
		#400 //39091260000000.0 * 4.4909245e-20 = 39091260000000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10010000001000100011001100001011;
		b = 32'b11100111100011111000011100100100;
		correct = 32'b11100111100011111000011100100100;
		#400 //-3.198819e-29 * -1.3555826e+24 = -1.3555826e+24
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00000100010001100101010111111000;
		b = 32'b10101000000111000010100000101011;
		correct = 32'b10101000000111000010100000101011;
		#400 //2.3314263e-36 * -8.66845e-15 = -8.66845e-15
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11011000101110110101100001110010;
		b = 32'b01100000111110110111111101011000;
		correct = 32'b01100000111110110111111010011101;
		#400 //-1647908400000000.0 * 1.449784e+20 = 1.4497676e+20
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10000000010101111011111001011100;
		b = 32'b01101010000111100001101110000110;
		correct = 32'b01101010000111100001101110000110;
		#400 //-8.057976e-39 * 4.7785064e+25 = 4.7785064e+25
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00100011100101010011101000001011;
		b = 32'b11000000110010001000110100010111;
		correct = 32'b11000000110010001000110100010111;
		#400 //1.6179195e-17 * -6.267223 = -6.267223
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10100001111010011010000110101111;
		b = 32'b01101100000101100011011101101001;
		correct = 32'b01101100000101100011011101101001;
		#400 //-1.5831491e-18 * 7.2640216e+26 = 7.2640216e+26
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11001100101010001101011000000101;
		b = 32'b00000101110001100110000100010001;
		correct = 32'b11001100101010001101011000000101;
		#400 //-88518696.0 * 1.8655487e-35 = -88518696.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01011110101001001111111001001110;
		b = 32'b10111000011010000100000011110001;
		correct = 32'b01011110101001001111111001001110;
		#400 //5.944513e+18 * -5.537359e-05 = 5.944513e+18
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01101110000101110100000100010011;
		b = 32'b11011011110010101010110110011010;
		correct = 32'b01101110000101110100000100010011;
		#400 //1.1702727e+28 * -1.14097644e+17 = 1.1702727e+28
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01001010110010100011010111001000;
		b = 32'b00000110100000001000101010110010;
		correct = 32'b01001010110010100011010111001000;
		#400 //6626020.0 * 4.8352043e-35 = 6626020.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10101010001001011110110110110101;
		b = 32'b10001111100011110000010011000011;
		correct = 32'b10101010001001011110110110110101;
		#400 //-1.4737415e-13 * -1.4102723e-29 = -1.4737415e-13
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10010111100000101011111100100000;
		b = 32'b10000011000111111000110110011000;
		correct = 32'b10010111100000101011111100100000;
		#400 //-8.4493e-25 * -4.688844e-37 = -8.4493e-25
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11111000100100111010011111101100;
		b = 32'b11011001101101010000110000110111;
		correct = 32'b11111000100100111010011111101100;
		#400 //-2.3958547e+34 * -6370050000000000.0 = -2.3958547e+34
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10010111000000001111011110011000;
		b = 32'b11111001010000110001100001101100;
		correct = 32'b11111001010000110001100001101100;
		#400 //-4.167154e-25 * -6.3312076e+34 = -6.3312076e+34
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10100111110100110000111111010001;
		b = 32'b10111110010101001000100100101010;
		correct = 32'b10111110010101001000100100101010;
		#400 //-5.8581413e-15 * -0.20755449 = -0.20755449
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10011101101100111000010110011110;
		b = 32'b01001110100010000000101110000001;
		correct = 32'b01001110100010000000101110000001;
		#400 //-4.7519062e-21 * 1141227600.0 = 1141227600.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00100110111010110010001011011010;
		b = 32'b01101001101110010101110110101100;
		correct = 32'b01101001101110010101110110101100;
		#400 //1.6315847e-15 * 2.8011704e+25 = 2.8011704e+25
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10110011010111110110111110101101;
		b = 32'b10110101010000010100010000001001;
		correct = 32'b10110101010011110011101100000100;
		#400 //-5.2022802e-08 * -7.1997107e-07 = -7.719939e-07
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10000000011100010100000100000011;
		b = 32'b00000001100001111110011010001010;
		correct = 32'b00000001010101110010110010010010;
		#400 //-1.0400733e-38 * 4.9921975e-38 = 3.952124e-38
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01010010010001110000010110000100;
		b = 32'b10110010011011010110110011101100;
		correct = 32'b01010010010001110000010110000100;
		#400 //213697760000.0 * -1.3819982e-08 = 213697760000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01100100001111110001010000010100;
		b = 32'b11111000111000000011111001011011;
		correct = 32'b11111000111000000011111001011011;
		#400 //1.40991e+22 * -3.63856e+34 = -3.63856e+34
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01000110111110000101001101111100;
		b = 32'b10000000110110100000001100101100;
		correct = 32'b01000110111110000101001101111100;
		#400 //31785.742 * -2.0021276e-38 = 31785.742
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00001001111010110001010010010011;
		b = 32'b10110000000000111110001101101110;
		correct = 32'b10110000000000111110001101101110;
		#400 //5.659354e-33 * -4.798072e-10 = -4.798072e-10
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01010101100100010011101100000010;
		b = 32'b11110110000100100111110001100110;
		correct = 32'b11110110000100100111110001100110;
		#400 //19960328000000.0 * -7.427719e+32 = -7.427719e+32
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01100000110111010011001110100101;
		b = 32'b11110110100110111100001001100001;
		correct = 32'b11110110100110111100001001100001;
		#400 //1.2751412e+20 * -1.5795869e+33 = -1.5795869e+33
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00000111110110000001111101110110;
		b = 32'b01111101110000101000010110001100;
		correct = 32'b01111101110000101000010110001100;
		#400 //3.251856e-34 * 3.2320456e+37 = 3.2320456e+37
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01101101011000100000010010100100;
		b = 32'b01111110110000101110000110110010;
		correct = 32'b01111110110000101110000110110010;
		#400 //4.3718264e+27 * 1.2952105e+38 = 1.2952105e+38
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01000000010100010100010010111101;
		b = 32'b01111010011011001011101111101100;
		correct = 32'b01111010011011001011101111101100;
		#400 //3.2698205 * 3.072984e+35 = 3.072984e+35
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10001100011001111011000000001111;
		b = 32'b11101111101110010011111001110100;
		correct = 32'b11101111101110010011111001110100;
		#400 //-1.7848573e-31 * -1.1466046e+29 = -1.1466046e+29
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00111111011100011101000100101110;
		b = 32'b00010000000100100011111010001111;
		correct = 32'b00111111011100011101000100101110;
		#400 //0.9445981 * 2.8841616e-29 = 0.9445981
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00110011110001111000100100110001;
		b = 32'b10100000100001000010010111010100;
		correct = 32'b00110011110001111000100100110001;
		#400 //9.2916146e-08 * -2.2386702e-19 = 9.2916146e-08
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00111010111100001100100101011111;
		b = 32'b11101111000101000001110001111010;
		correct = 32'b11101111000101000001110001111010;
		#400 //0.001837056 * -4.5838208e+28 = -4.5838208e+28
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01101010100101000001001111001011;
		b = 32'b00000101101111000000010000110011;
		correct = 32'b01101010100101000001001111001011;
		#400 //8.950725e+25 * 1.7680978e-35 = 8.950725e+25
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01110000111101110010010000111111;
		b = 32'b00110110011011111011010001110101;
		correct = 32'b01110000111101110010010000111111;
		#400 //6.1189293e+29 * 3.5718815e-06 = 6.1189293e+29
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10010100000101001111100101011111;
		b = 32'b10100100101011100100010010111001;
		correct = 32'b10100100101011100100010010111001;
		#400 //-7.52127e-27 * -7.557689e-17 = -7.557689e-17
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01101101010000000001101100000100;
		b = 32'b00101001001000011110110000110110;
		correct = 32'b01101101010000000001101100000100;
		#400 //3.7158614e+27 * 3.5954062e-14 = 3.7158614e+27
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01110101011011000000100111111100;
		b = 32'b01111110000111100010111000010011;
		correct = 32'b01111110000111100010111001001110;
		#400 //2.9921498e+32 * 5.2564314e+37 = 5.2564613e+37
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01100111010011001010010000000101;
		b = 32'b01001101111011111010000101100001;
		correct = 32'b01100111010011001010010000000101;
		#400 //9.663884e+23 * 502541340.0 = 9.663884e+23
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10000110111010000100000001001010;
		b = 32'b01100101010100011000101111111000;
		correct = 32'b01100101010100011000101111111000;
		#400 //-8.7363165e-35 * 6.1847285e+22 = 6.1847285e+22
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00011000010010000101100101001000;
		b = 32'b11100010010110001100000110011101;
		correct = 32'b11100010010110001100000110011101;
		#400 //2.589447e-24 * -9.99612e+20 = -9.99612e+20
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00000111001010000110110101110101;
		b = 32'b11011111110011001111111101101111;
		correct = 32'b11011111110011001111111101101111;
		#400 //1.2671082e-34 * -2.9543295e+19 = -2.9543295e+19
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00111011000010000100101111011100;
		b = 32'b00111111111110000001111001000010;
		correct = 32'b00111111111110000110001001101000;
		#400 //0.002079717 * 1.9384234 = 1.9405031
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00111110111000100111000000000000;
		b = 32'b00110000010111111000110101000111;
		correct = 32'b00111110111000100111000000000000;
		#400 //0.44226074 * 8.1327695e-10 = 0.44226074
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11110000110001001000110100111101;
		b = 32'b10100101000111010010111010100011;
		correct = 32'b11110000110001001000110100111101;
		#400 //-4.8663847e+29 * -1.363338e-16 = -4.8663847e+29
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11101010000010111001010101100100;
		b = 32'b00100111010100100100111111011000;
		correct = 32'b11101010000010111001010101100100;
		#400 //-4.218654e+25 * 2.9186638e-15 = -4.218654e+25
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11010100100110100001111111110100;
		b = 32'b01000010011001010100001110000000;
		correct = 32'b11010100100110100001111111110100;
		#400 //-5295688400000.0 * 57.315918 = -5295688400000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01111000000011110001000100101101;
		b = 32'b00110111100000110110011111010001;
		correct = 32'b01111000000011110001000100101101;
		#400 //1.1606982e+34 * 1.566476e-05 = 1.1606982e+34
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01101110110100000010110000100100;
		b = 32'b00111011011000011010011010101101;
		correct = 32'b01101110110100000010110000100100;
		#400 //3.2213122e+28 * 0.0034431622 = 3.2213122e+28
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01110110011001011110111110000001;
		b = 32'b01000100101110100001111011101011;
		correct = 32'b01110110011001011110111110000001;
		#400 //1.1659118e+33 * 1488.9662 = 1.1659118e+33
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11001010101101010111111001010001;
		b = 32'b11100011100111101110000101001111;
		correct = 32'b11100011100111101110000101001111;
		#400 //-5947176.5 * -5.8616415e+21 = -5.8616415e+21
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01000000111100101101111010101101;
		b = 32'b11001110011100101000001110101100;
		correct = 32'b11001110011100101000001110101100;
		#400 //7.589682 * -1017178900.0 = -1017178900.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10000100110011011011010111001001;
		b = 32'b01100111111111011010001100000000;
		correct = 32'b01100111111111011010001100000000;
		#400 //-4.836221e-36 * 2.3955311e+24 = 2.3955311e+24
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11101001111001001001110000110001;
		b = 32'b11000011000101000011011100011100;
		correct = 32'b11101001111001001001110000110001;
		#400 //-3.4546585e+25 * -148.21527 = -3.4546585e+25
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10010000001000111010100111001111;
		b = 32'b11000111001001010101111010110110;
		correct = 32'b11000111001001010101111010110110;
		#400 //-3.2276898e-29 * -42334.71 = -42334.71
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11001110011001000100101011111101;
		b = 32'b11101101101100000110010000111010;
		correct = 32'b11101101101100000110010000111010;
		#400 //-957529900.0 * -6.823816e+27 = -6.823816e+27
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01100101001010110111101011010101;
		b = 32'b10110001011001000100111010101001;
		correct = 32'b01100101001010110111101011010101;
		#400 //5.0611907e+22 * -3.322308e-09 = 5.0611907e+22
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10101011111110101100001001100100;
		b = 32'b10000011001110000011111011111101;
		correct = 32'b10101011111110101100001001100100;
		#400 //-1.7817523e-12 * -5.4145047e-37 = -1.7817523e-12
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01000011010100000011110001110001;
		b = 32'b10111010010110001000101101001110;
		correct = 32'b01000011010100000011110000111011;
		#400 //208.2361 * -0.0008260504 = 208.23528
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11011010101101111111111100001010;
		b = 32'b11001011101010101011110111000110;
		correct = 32'b11011010101101111111111100001010;
		#400 //-2.589517e+16 * -22379404.0 = -2.589517e+16
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00011110100100101010000000101101;
		b = 32'b10100000110010110010010100100110;
		correct = 32'b10100000110000011111101100100011;
		#400 //1.5524598e-20 * -3.441412e-19 = -3.286166e-19
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01011000110001010001011101110000;
		b = 32'b01001011111001110000000100101011;
		correct = 32'b01011000110001010001011101110000;
		#400 //1733635600000000.0 * 30278230.0 = 1733635600000000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01110001011111111110111011100011;
		b = 32'b01111010000110110000101010100010;
		correct = 32'b01111010000110110000101011100010;
		#400 //1.2673196e+30 * 2.0125542e+35 = 2.0125669e+35
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00010111001111100000100100011101;
		b = 32'b01001011101000110000011101010010;
		correct = 32'b01001011101000110000011101010010;
		#400 //6.1403814e-25 * 21368484.0 = 21368484.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10011010001101100100111000101111;
		b = 32'b01100001110101110111111011110111;
		correct = 32'b01100001110101110111111011110111;
		#400 //-3.7699874e-23 * 4.9689984e+20 = 4.9689984e+20
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11100000010011010111000100010101;
		b = 32'b11011011111010000001001100010010;
		correct = 32'b11100000010011011110010100011111;
		#400 //-5.9214546e+19 * -1.30646325e+17 = -5.9345195e+19
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10111111110010011100110110101011;
		b = 32'b00011011010110101000100100100100;
		correct = 32'b10111111110010011100110110101011;
		#400 //-1.576589 * 1.807685e-22 = -1.576589
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00101010110110110000011100100010;
		b = 32'b11011001110001000101000000001000;
		correct = 32'b11011001110001000101000000001000;
		#400 //3.8907164e-13 * -6907136300000000.0 = -6907136300000000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11101010001101101101000000001000;
		b = 32'b10010100011101010100000010110000;
		correct = 32'b11101010001101101101000000001000;
		#400 //-5.5251725e+25 * -1.2382096e-26 = -5.5251725e+25
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00010010011000110101001111100101;
		b = 32'b11001111001101101011101011010011;
		correct = 32'b11001111001101101011101011010011;
		#400 //7.173198e-28 * -3065697000.0 = -3065697000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11111111111110101000011001111110;
		b = 32'b10111111101001000000000011011011;
		correct = 32'b11111111111110101000011001111110;
		#400 //nan * -1.2812761 = nan
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10111101101000011011111011101001;
		b = 32'b11011000110110010011001010100011;
		correct = 32'b11011000110110010011001010100011;
		#400 //-0.07897741 * -1910492000000000.0 = -1910492000000000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01000000001110110000111110010110;
		b = 32'b11101110100010000000011100010010;
		correct = 32'b11101110100010000000011100010010;
		#400 //2.9228263 * -2.1049254e+28 = -2.1049254e+28
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10001100111111101100000010001100;
		b = 32'b11000010101000100000011010011100;
		correct = 32'b11000010101000100000011010011100;
		#400 //-3.9250781e-31 * -81.01291 = -81.01291
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01000110001001011101101110101100;
		b = 32'b01111111011011000000010101010010;
		correct = 32'b01111111011011000000010101010010;
		#400 //10614.918 * 3.1372543e+38 = 3.1372543e+38
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10110100110101001100010011011011;
		b = 32'b11101100100101000111101011111110;
		correct = 32'b11101100100101000111101011111110;
		#400 //-3.9631308e-07 * -1.4360147e+27 = -1.4360147e+27
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10110110111110010100000001011101;
		b = 32'b10010101111011101010011011010010;
		correct = 32'b10110110111110010100000001011101;
		#400 //-7.428271e-06 * -9.639063e-26 = -7.428271e-06
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01000110101101111011110000111100;
		b = 32'b11000011111001000010001101100010;
		correct = 32'b01000110101101000010101110101110;
		#400 //23518.117 * -456.27643 = 23061.84
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01011000110000000110010110110110;
		b = 32'b10011100101000010110010000011100;
		correct = 32'b01011000110000000110010110110110;
		#400 //1692344600000000.0 * -1.0679964e-21 = 1692344600000000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10101000100110101011001100101001;
		b = 32'b00101010001010101111100100000100;
		correct = 32'b00101010000101111010001010011111;
		#400 //-1.7175133e-14 * 1.5185428e-13 = 1.3467915e-13
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01111101010101011101001101110110;
		b = 32'b11000000101001010011100001101001;
		correct = 32'b01111101010101011101001101110110;
		#400 //1.7763971e+37 * -5.163136 = 1.7763971e+37
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11001110110100011000011010111001;
		b = 32'b11001011010000100000100101011000;
		correct = 32'b11001110110100110000101011001100;
		#400 //-1757633700.0 * -12716376.0 = -1770350100.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11110101001111010000001100110010;
		b = 32'b00001001100010011110010101111011;
		correct = 32'b11110101001111010000001100110010;
		#400 //-2.3960179e+32 * 3.3197353e-33 = -2.3960179e+32
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00000100101100110001111100001111;
		b = 32'b00101101110101100001001001001101;
		correct = 32'b00101101110101100001001001001101;
		#400 //4.211122e-36 * 2.433711e-11 = 2.433711e-11
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00001001000010001110001110111011;
		b = 32'b01000010000001010000111001101001;
		correct = 32'b01000010000001010000111001101001;
		#400 //1.6477483e-33 * 33.264072 = 33.264072
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00110111100110000101001111101011;
		b = 32'b00111001110001101111100000101101;
		correct = 32'b00111001110100000111110101101100;
		#400 //1.815889e-05 * 0.00037950408 = 0.00039766298
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10100010101001111100011111001000;
		b = 32'b00010110100001000001000010010100;
		correct = 32'b10100010101001111100011111000111;
		#400 //-4.5476967e-18 * 2.1336212e-25 = -4.5476963e-18
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11101110111100011011000010011011;
		b = 32'b11100100111011111001010011100010;
		correct = 32'b11101110111100011011000010101010;
		#400 //-3.7399695e+28 * -3.5356e+22 = -3.739973e+28
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11101010011101000111111010010011;
		b = 32'b10001111000010001101110010111111;
		correct = 32'b11101010011101000111111010010011;
		#400 //-7.3893907e+25 * -6.747832e-30 = -7.3893907e+25
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01110010010101111110011000000011;
		b = 32'b00111101010001011010001010011111;
		correct = 32'b01110010010101111110011000000011;
		#400 //4.27631e+30 * 0.04825079 = 4.27631e+30
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11111010111101101110100001100100;
		b = 32'b01110000000101101110100111101111;
		correct = 32'b11111010111101101110100001011111;
		#400 //-6.4100923e+35 * 1.8682224e+29 = -6.4100904e+35
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00101010110011101001110000001010;
		b = 32'b10010001111001000000111010100000;
		correct = 32'b00101010110011101001110000001010;
		#400 //3.6701225e-13 * -3.598107e-28 = 3.6701225e-13
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10111111101111110011000001000010;
		b = 32'b01111001110101110001001100010011;
		correct = 32'b01111001110101110001001100010011;
		#400 //-1.4936602 * 1.3959134e+35 = 1.3959134e+35
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11111100010010101101001001101111;
		b = 32'b01111010101110101100001011010101;
		correct = 32'b11111100001100110111101000010100;
		#400 //-4.2124483e+36 * 4.8485944e+35 = -3.7275887e+36
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00110110011010101011011111111000;
		b = 32'b01001101010100011100000111010110;
		correct = 32'b01001101010100011100000111010110;
		#400 //3.49758e-06 * 219946340.0 = 219946340.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11001011101000100100001111001000;
		b = 32'b00110101101010010110001000110101;
		correct = 32'b11001011101000100100001111001000;
		#400 //-21268368.0 * 1.2620063e-06 = -21268368.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00101011101111011100111111101111;
		b = 32'b01011001001101100101100000000010;
		correct = 32'b01011001001101100101100000000010;
		#400 //1.3486971e-12 * 3207825700000000.0 = 3207825700000000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11011001000101011011111111010111;
		b = 32'b10100011001010000000001011111010;
		correct = 32'b11011001000101011011111111010111;
		#400 //-2634418900000000.0 * -9.1079286e-18 = -2634418900000000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11100100110110100101100011100101;
		b = 32'b01010100111000101001011000110000;
		correct = 32'b11100100110110100101100011100101;
		#400 //-3.2222366e+22 * 7785458700000.0 = -3.2222366e+22
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11001001010001100100101000111100;
		b = 32'b01000110101011000100100000001001;
		correct = 32'b11001001010000001110011111111100;
		#400 //-812195.75 * 22052.018 = -790143.75
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11011011001110101011011110001101;
		b = 32'b00110111001011010000101010010001;
		correct = 32'b11011011001110101011011110001101;
		#400 //-5.255616e+16 * 1.0314064e-05 = -5.255616e+16
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01100010010011001010110101111010;
		b = 32'b01111110110110110000011010001110;
		correct = 32'b01111110110110110000011010001110;
		#400 //9.43909e+20 * 1.4556748e+38 = 1.4556748e+38
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01011001011010000011101001100011;
		b = 32'b00011101011000000010010001010111;
		correct = 32'b01011001011010000011101001100011;
		#400 //4085399500000000.0 * 2.966494e-21 = 4085399500000000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01001011111011111110010000111100;
		b = 32'b11101000001110100011101100011101;
		correct = 32'b11101000001110100011101100011101;
		#400 //31443064.0 * -3.5178025e+24 = -3.5178025e+24
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10111011011001000100101001100011;
		b = 32'b01010110010011011111010001001001;
		correct = 32'b01010110010011011111010001001001;
		#400 //-0.0034834377 * 56612270000000.0 = 56612270000000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01001010000010000101111001010101;
		b = 32'b10001110001001001011101100100000;
		correct = 32'b01001010000010000101111001010101;
		#400 //2234261.2 * -2.0304658e-30 = 2234261.2
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11110010101100111111011010110001;
		b = 32'b10001111001011100111101100010101;
		correct = 32'b11110010101100111111011010110001;
		#400 //-7.129094e+30 * -8.602567e-30 = -7.129094e+30
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00100110000100110110110001111111;
		b = 32'b00011101100111111001110011110010;
		correct = 32'b00100110000100110110110011001111;
		#400 //5.114791e-16 * 4.2249227e-21 = 5.1148333e-16
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01111101010100001100100100101100;
		b = 32'b10010110111101111011000001110011;
		correct = 32'b01111101010100001100100100101100;
		#400 //1.7345248e+37 * -4.0016357e-25 = 1.7345248e+37
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10001001010010001110001001001010;
		b = 32'b11100101110001110111001100111100;
		correct = 32'b11100101110001110111001100111100;
		#400 //-2.4180525e-33 * -1.1773458e+23 = -1.1773458e+23
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11011110010001110100000001010110;
		b = 32'b00111100111000110111100111011011;
		correct = 32'b11011110010001110100000001010110;
		#400 //-3.5893925e+18 * 0.027768066 = -3.5893925e+18
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00001100010000110100010110101101;
		b = 32'b00111001000110010111110001100111;
		correct = 32'b00111001000110010111110001100111;
		#400 //1.5043221e-31 * 0.0001463756 = 0.0001463756
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10010101111010101001010111000110;
		b = 32'b00001111010010001101111010000010;
		correct = 32'b10010101111010101000111101111111;
		#400 //-9.474815e-26 * 9.903615e-30 = -9.4738244e-26
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01110100010001010101111011000001;
		b = 32'b11011111110011011010101100010111;
		correct = 32'b01110100010001010101111011000001;
		#400 //6.254909e+31 * -2.9639929e+19 = 6.254909e+31
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10100101100011001111111101101010;
		b = 32'b01110100111010111011000000111000;
		correct = 32'b01110100111010111011000000111000;
		#400 //-2.4459204e-16 * 1.4938524e+32 = 1.4938524e+32
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10010010101011111010100101111011;
		b = 32'b01000101001000101111110110101000;
		correct = 32'b01000101001000101111110110101000;
		#400 //-1.1085833e-27 * 2607.8535 = 2607.8535
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01111011010010000010101111100001;
		b = 32'b11110011011111100111111000100011;
		correct = 32'b01111011010010000010101011100011;
		#400 //1.03934934e+36 * -2.0162991e+31 = 1.0393292e+36
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10101111111010001110100001101000;
		b = 32'b00101110001111100101001110010011;
		correct = 32'b10101111110100010001110111110110;
		#400 //-4.236569e-10 * 4.3275227e-11 = -3.8038167e-10
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10010000000100100001001000110011;
		b = 32'b01110010110000101010000001111000;
		correct = 32'b01110010110000101010000001111000;
		#400 //-2.8807443e-29 * 7.709963e+30 = 7.709963e+30
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11000101110011110101010001011010;
		b = 32'b01001110010000111000111001101011;
		correct = 32'b01001110010000111000111000000011;
		#400 //-6634.544 * 820222660.0 = 820216000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01101101011011010011111101010101;
		b = 32'b11111101111111100110001010101001;
		correct = 32'b11111101111111100110001010101001;
		#400 //4.589032e+27 * -4.2267023e+37 = -4.2267023e+37
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00111000001011010011011000101111;
		b = 32'b01000110111101011111100010100111;
		correct = 32'b01000110111101011111100010100111;
		#400 //4.1296877e-05 * 31484.326 = 31484.326
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01111011001000100100011111001100;
		b = 32'b10001101100011001010010001000111;
		correct = 32'b01111011001000100100011111001100;
		#400 //8.426083e+35 * -8.6677145e-31 = 8.426083e+35
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10110100111111111110111101100011;
		b = 32'b00110000101110111000000101000001;
		correct = 32'b10110100111111110011001111100010;
		#400 //-4.7671628e-07 * 1.3642777e-09 = -4.75352e-07
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10010010000011110011011001111110;
		b = 32'b00111010111101010010101111100100;
		correct = 32'b00111010111101010010101111100100;
		#400 //-4.519001e-28 * 0.0018705097 = 0.0018705097
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00111000101010110101100100011111;
		b = 32'b10010100110011101101001111101011;
		correct = 32'b00111000101010110101100100011111;
		#400 //8.1705155e-05 * -2.0884271e-26 = 8.1705155e-05
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00011110100111000100100001110110;
		b = 32'b00001010001100101100001001010101;
		correct = 32'b00011110100111000100100001110110;
		#400 //1.6547112e-20 * 8.606938e-33 = 1.6547112e-20
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00111011111100110010000110111100;
		b = 32'b10110110000110010110111111010111;
		correct = 32'b00111011111100110000111010001110;
		#400 //0.007419793 * -2.2863876e-06 = 0.0074175065
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00001110011011110101111110110010;
		b = 32'b00111110011001111001110001111100;
		correct = 32'b00111110011001111001110001111100;
		#400 //2.95051e-30 * 0.22618288 = 0.22618288
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00110100101001100010001010110000;
		b = 32'b10000011011100110110001101100011;
		correct = 32'b00110100101001100010001010110000;
		#400 //3.0945148e-07 * -7.152537e-37 = 3.0945148e-07
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10001100101011000100110000001101;
		b = 32'b00100100001101101101110111110110;
		correct = 32'b00100100001101101101110111110110;
		#400 //-2.6546567e-31 * 3.9652967e-17 = 3.9652967e-17
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00110100111011001110011011110110;
		b = 32'b10000001010110000000100011100111;
		correct = 32'b00110100111011001110011011110110;
		#400 //4.4126472e-07 * -3.9679321e-38 = 4.4126472e-07
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00010001000010101110100001100110;
		b = 32'b11010111000011000110001010101010;
		correct = 32'b11010111000011000110001010101010;
		#400 //1.0957894e-28 * -154355390000000.0 = -154355390000000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10011011010011000011101011110101;
		b = 32'b00000111000101001000110111011001;
		correct = 32'b10011011010011000011101011110101;
		#400 //-1.6893535e-22 * 1.1175968e-34 = -1.6893535e-22
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11010001100000101110010101100100;
		b = 32'b00000000000011011101010010000101;
		correct = 32'b11010001100000101110010101100100;
		#400 //-70274286000.0 * 1.270099e-39 = -70274286000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11100010001110101000111101001101;
		b = 32'b10100111011110111001111111010010;
		correct = 32'b11100010001110101000111101001101;
		#400 //-8.603551e+20 * -3.4919886e-15 = -8.603551e+20
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01001111000010110000101001001000;
		b = 32'b10101100101001011010110101110001;
		correct = 32'b01001111000010110000101001001000;
		#400 //2332706800.0 * -4.708838e-12 = 2332706800.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11010001111100000001100110011101;
		b = 32'b10101110110111100011100111101001;
		correct = 32'b11010001111100000001100110011101;
		#400 //-128902730000.0 * -1.0105678e-10 = -128902730000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11011000101001011010010101100010;
		b = 32'b11010111111011010011110101111111;
		correct = 32'b11011000111000001111010011000010;
		#400 //-1457037900000000.0 * -521696760000000.0 = -1978734700000000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01011001000011000100001001011101;
		b = 32'b01010011001110101001101001110100;
		correct = 32'b01011001000011000100111000000111;
		#400 //2467466500000000.0 * 801455200000.0 = 2468268000000000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11000101111001001101101100011010;
		b = 32'b10011100011101111100001100000000;
		correct = 32'b11000101111001001101101100011010;
		#400 //-7323.3877 * -8.1977476e-22 = -7323.3877
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01100100100110001011100000110000;
		b = 32'b11100010100100101100110111111010;
		correct = 32'b01100100100011111000101101010000;
		#400 //2.2537418e+22 * -1.3540334e+21 = 2.1183383e+22
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10100010100100001000101111111111;
		b = 32'b00001001000000110110010101011011;
		correct = 32'b10100010100100001000101111111111;
		#400 //-3.9179505e-18 * 1.5816209e-33 = -3.9179505e-18
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01000000011100101010101000011111;
		b = 32'b10011111111001100110110010101010;
		correct = 32'b01000000011100101010101000011111;
		#400 //3.7916334 * -9.758856e-20 = 3.7916334
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00110000000110010111000000011111;
		b = 32'b11000011011011110011110111110101;
		correct = 32'b11000011011011110011110111110101;
		#400 //5.582041e-10 * -239.24202 = -239.24202
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11111010010000110111011101010011;
		b = 32'b10100101011011100010011010111110;
		correct = 32'b11111010010000110111011101010011;
		#400 //-2.5372952e+35 * -2.0656336e-16 = -2.5372952e+35
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11110011000011000110001111111101;
		b = 32'b01000001100000101000110110011010;
		correct = 32'b11110011000011000110001111111101;
		#400 //-1.1122888e+31 * 16.319141 = -1.1122888e+31
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11001011111000000011010100001110;
		b = 32'b01110111111000101011111110101111;
		correct = 32'b01110111111000101011111110101111;
		#400 //-29387292.0 * 9.1980226e+33 = 9.1980226e+33
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01110111000100000011001001001000;
		b = 32'b11011101110101111001011000111010;
		correct = 32'b01110111000100000011001001001000;
		#400 //2.9246507e+33 * -1.9418335e+18 = 2.9246507e+33
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10011100101010001000000110100111;
		b = 32'b00101101011011100001111110111011;
		correct = 32'b00101101011011100001111110111011;
		#400 //-1.1150822e-21 * 1.3535779e-11 = 1.3535779e-11
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01000100111111011101011011010111;
		b = 32'b11111010101110111011001100110001;
		correct = 32'b11111010101110111011001100110001;
		#400 //2030.7137 * -4.8729697e+35 = -4.8729697e+35
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01011001100101101100001010000001;
		b = 32'b10111100101000100011111000000001;
		correct = 32'b01011001100101101100001010000001;
		#400 //5304388000000000.0 * -0.019804956 = 5304388000000000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01000001110110101000101111011100;
		b = 32'b01110001000011111110110000101110;
		correct = 32'b01110001000011111110110000101110;
		#400 //27.31829 * 7.126701e+29 = 7.126701e+29
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01010101011010111010111101010010;
		b = 32'b01000110000011001110111000100000;
		correct = 32'b01010101011010111010111101010010;
		#400 //16196139000000.0 * 9019.531 = 16196139000000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00010000101100111010110010001000;
		b = 32'b01000100101010010101010111000101;
		correct = 32'b01000100101010010101010111000101;
		#400 //7.086888e-29 * 1354.6803 = 1354.6803
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01001110001111100000110011010000;
		b = 32'b00011011001110011011011111010001;
		correct = 32'b01001110001111100000110011010000;
		#400 //797127700.0 * 1.5362236e-22 = 797127700.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00001111011101101100110000100110;
		b = 32'b00111010001000110110001001001111;
		correct = 32'b00111010001000110110001001001111;
		#400 //1.2168054e-29 * 0.00062326057 = 0.00062326057
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11111010000010100111010111110100;
		b = 32'b00011001100110001111011101010111;
		correct = 32'b11111010000010100111010111110100;
		#400 //-1.7973234e+35 * 1.5816331e-23 = -1.7973234e+35
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00010010000011100111001011011000;
		b = 32'b01010010110111011101000101110100;
		correct = 32'b01010010110111011101000101110100;
		#400 //4.4948855e-28 * 476350900000.0 = 476350900000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10101010011001011110011011001100;
		b = 32'b11110101111110011100101011011010;
		correct = 32'b11110101111110011100101011011010;
		#400 //-2.041936e-13 * -6.3329894e+32 = -6.3329894e+32
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01110111001100111101110011101010;
		b = 32'b10010110010101010001011001011010;
		correct = 32'b01110111001100111101110011101010;
		#400 //3.648054e+33 * -1.7213056e-25 = 3.648054e+33
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00111101110100011011111010011111;
		b = 32'b11100010101000111101001101011110;
		correct = 32'b11100010101000111101001101011110;
		#400 //0.10241436 * -1.511025e+21 = -1.511025e+21
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01001000101111110101111000011100;
		b = 32'b10011111110100010110000111101010;
		correct = 32'b01001000101111110101111000011100;
		#400 //391920.88 * -8.867693e-20 = 391920.88
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11110000101001110101101011111111;
		b = 32'b01000010000010011001011111111010;
		correct = 32'b11110000101001110101101011111111;
		#400 //-4.1435203e+29 * 34.398415 = -4.1435203e+29
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01100110101010000011110010010101;
		b = 32'b01011011110101111011111001111001;
		correct = 32'b01100110101010000011110010011000;
		#400 //3.9723756e+23 * 1.2145309e+17 = 3.9723766e+23
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10101100011100000010000001010110;
		b = 32'b11011100101000001011101110100101;
		correct = 32'b11011100101000001011101110100101;
		#400 //-3.4124001e-12 * -3.619385e+17 = -3.619385e+17
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10001000011001101110101010011110;
		b = 32'b01100010000111111111001110010001;
		correct = 32'b01100010000111111111001110010001;
		#400 //-6.94889e-34 * 7.376458e+20 = 7.376458e+20
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11100000001100011111110101101011;
		b = 32'b10001100001111110011010111111010;
		correct = 32'b11100000001100011111110101101011;
		#400 //-5.13021e+19 * -1.4730348e-31 = -5.13021e+19
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01100110101010001110111111000101;
		b = 32'b10010000011010110000011011111001;
		correct = 32'b01100110101010001110111111000101;
		#400 //3.9889027e+23 * -4.635095e-29 = 3.9889027e+23
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10101111010001100011111100001101;
		b = 32'b01111110101000001100100101000100;
		correct = 32'b01111110101000001100100101000100;
		#400 //-1.8030395e-10 * 1.0686076e+38 = 1.0686076e+38
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00111111110100111010011100001001;
		b = 32'b01011101000001110000100001001011;
		correct = 32'b01011101000001110000100001001011;
		#400 //1.653535 * 6.0813184e+17 = 6.0813184e+17
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10000000111010100110101010100011;
		b = 32'b00010000110110111001110111010110;
		correct = 32'b00010000110110111001110111010110;
		#400 //-2.152776e-38 * 8.6623454e-29 = 8.6623454e-29
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11001010011101001001010100110111;
		b = 32'b01101101111001000101100100010101;
		correct = 32'b01101101111001000101100100010101;
		#400 //-4007245.8 * 8.8337845e+27 = 8.8337845e+27
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11101010100011111110010111010010;
		b = 32'b00001010101110000011011101100000;
		correct = 32'b11101010100011111110010111010010;
		#400 //-8.698084e+25 * 1.7739385e-32 = -8.698084e+25
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00100000000101000110100011101010;
		b = 32'b01100111001111010001100000011101;
		correct = 32'b01100111001111010001100000011101;
		#400 //1.2570801e-19 * 8.929721e+23 = 8.929721e+23
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10101100000110001011100100001000;
		b = 32'b00111001100101010011111110111100;
		correct = 32'b00111001100101010011111110111100;
		#400 //-2.1703212e-12 * 0.0002846698 = 0.0002846698
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00010101100010101111010101010110;
		b = 32'b10110001101010001101100110000100;
		correct = 32'b10110001101010001101100110000100;
		#400 //5.612483e-26 * -4.914172e-09 = -4.914172e-09
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10100101101101111011010001000100;
		b = 32'b10111010111100011010011000011010;
		correct = 32'b10111010111100011010011000011010;
		#400 //-3.1867592e-16 * -0.0018436343 = -0.0018436343
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00101101000001010001101110100110;
		b = 32'b11011001011010001100111000000101;
		correct = 32'b11011001011010001100111000000101;
		#400 //7.566314e-12 * -4095544700000000.0 = -4095544700000000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10100010101011110101111101101110;
		b = 32'b01011010001011111011000111010001;
		correct = 32'b01011010001011111011000111010001;
		#400 //-4.7534885e-18 * 1.2363408e+16 = 1.2363408e+16
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01100000000011100110111100100001;
		b = 32'b01001000001101110101100011110100;
		correct = 32'b01100000000011100110111100100001;
		#400 //4.1053833e+19 * 187747.81 = 4.1053833e+19
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01010111011010111100010001010001;
		b = 32'b10101100101100110010001001100000;
		correct = 32'b01010111011010111100010001010001;
		#400 //259228400000000.0 * -5.0913024e-12 = 259228400000000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10001001100111101000001100000000;
		b = 32'b00111000100010101001010101111010;
		correct = 32'b00111000100010101001010101111010;
		#400 //-3.816031e-33 * 6.608195e-05 = 6.608195e-05
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10011100111000100100101111011011;
		b = 32'b11110110001000000011000100011101;
		correct = 32'b11110110001000000011000100011101;
		#400 //-1.4975034e-21 * -8.122692e+32 = -8.122692e+32
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11101001100000100101101010110110;
		b = 32'b00010011000001101010111001001100;
		correct = 32'b11101001100000100101101010110110;
		#400 //-1.969859e+25 * 1.6999113e-27 = -1.969859e+25
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11010100000011011101100101001011;
		b = 32'b00101100101110100010011000011000;
		correct = 32'b11010100000011011101100101001011;
		#400 //-2436943800000.0 * 5.290667e-12 = -2436943800000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10010101101010010111110011000100;
		b = 32'b11000000001110010110100101010111;
		correct = 32'b11000000001110010110100101010111;
		#400 //-6.84554e-26 * -2.8970544 = -2.8970544
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10111101110110100010001111101011;
		b = 32'b10100110101100000110101011010111;
		correct = 32'b10111101110110100010001111101011;
		#400 //-0.10651382 * -1.2241412e-15 = -0.10651382
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10100101001100111010000101111111;
		b = 32'b11111100111001000010110000001000;
		correct = 32'b11111100111001000010110000001000;
		#400 //-1.5580492e-16 * -9.477894e+36 = -9.477894e+36
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11011001001000000111010010100100;
		b = 32'b10100011011110110000011110111110;
		correct = 32'b11011001001000000111010010100100;
		#400 //-2822765200000000.0 * -1.3608377e-17 = -2822765200000000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01100100111010010010000000111001;
		b = 32'b01011101000010100000101000101011;
		correct = 32'b01100100111010010010000101001101;
		#400 //3.4403306e+22 * 6.216756e+17 = 3.4403928e+22
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11001000011111000001000011011010;
		b = 32'b01111100101000101110010000010110;
		correct = 32'b01111100101000101110010000010110;
		#400 //-258115.4 * 6.766226e+36 = 6.766226e+36
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01000000101000001000101100000000;
		b = 32'b01100000000111110001110010101110;
		correct = 32'b01100000000111110001110010101110;
		#400 //5.016968 * 4.586092e+19 = 4.586092e+19
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11101000000001111001110000100111;
		b = 32'b01110100000100110100101000001100;
		correct = 32'b01110100000100110100101000001011;
		#400 //-2.5616e+24 * 4.6677825e+31 = 4.667782e+31
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00001101100011111100111010100000;
		b = 32'b11010001101100111001001111111011;
		correct = 32'b11010001101100111001001111111011;
		#400 //8.862799e-31 * -96410230000.0 = -96410230000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00110000000011100110001111000011;
		b = 32'b00101110010101110101101011000011;
		correct = 32'b00110000000110111101100101101111;
		#400 //5.180107e-10 * 4.8965953e-11 = 5.6697663e-10
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01000110101101100001110010011111;
		b = 32'b11001001010000010110101111100100;
		correct = 32'b11001001001110111011101011111111;
		#400 //23310.31 * -792254.25 = -768943.94
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11011011111111011101001010010110;
		b = 32'b01110001000101101000010001110111;
		correct = 32'b01110001000101101000010001110111;
		#400 //-1.4288942e+17 * 7.453263e+29 = 7.453263e+29
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10110101011111110100010011001011;
		b = 32'b10111001011101111010011011111001;
		correct = 32'b10111001011110001010011000111110;
		#400 //-9.509501e-07 * -0.00023617958 = -0.00023713053
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01010110010011110000111100010110;
		b = 32'b01010011110010101101011010110100;
		correct = 32'b01010110010101010110010111001100;
		#400 //56915925000000.0 * 1742371000000.0 = 58658298000000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01110011001011101011001001110000;
		b = 32'b01000010010001111001010000110001;
		correct = 32'b01110011001011101011001001110000;
		#400 //1.3840924e+31 * 49.89472 = 1.3840924e+31
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10001011010110100001110001001001;
		b = 32'b01010110110100000101011110001100;
		correct = 32'b01010110110100000101011110001100;
		#400 //-4.2006552e-32 * 114537215000000.0 = 114537215000000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10001100111010101100001001101001;
		b = 32'b11000111010000100111101111100111;
		correct = 32'b11000111010000100111101111100111;
		#400 //-3.6170415e-31 * -49787.902 = -49787.902
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00011111010000111111111110101010;
		b = 32'b01000101111001110001110010001001;
		correct = 32'b01000101111001110001110010001001;
		#400 //4.1504337e-20 * 7395.567 = 7395.567
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01101011101100001010110010100111;
		b = 32'b00001010100011011101000110001011;
		correct = 32'b01101011101100001010110010100111;
		#400 //4.2717254e+26 * 1.3656627e-32 = 4.2717254e+26
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10001000111011111011100001001110;
		b = 32'b00010011100100000010001001111110;
		correct = 32'b00010011100100000010001001111010;
		#400 //-1.4427619e-33 * 3.6384722e-27 = 3.6384707e-27
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00111010011111010010110100110101;
		b = 32'b10010111001101111111000110100101;
		correct = 32'b00111010011111010010110100110101;
		#400 //0.00096579205 * -5.9435487e-25 = 0.00096579205
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01000100010100001010111110110000;
		b = 32'b10100101110100001011111111100001;
		correct = 32'b01000100010100001010111110110000;
		#400 //834.7451 * -3.621227e-16 = 834.7451
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01011001111100010111111100110100;
		b = 32'b10010100110110000101011010101110;
		correct = 32'b01011001111100010111111100110100;
		#400 //8496916300000000.0 * -2.1844615e-26 = 8496916300000000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10011100000101001011111101110001;
		b = 32'b00111001110101100111001100011100;
		correct = 32'b00111001110101100111001100011100;
		#400 //-4.9216524e-22 * 0.00040903024 = 0.00040903024
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10010001100010010111001110110000;
		b = 32'b11100010011101111010011010010010;
		correct = 32'b11100010011101111010011010010010;
		#400 //-2.1686087e-28 * -1.1420871e+21 = -1.1420871e+21
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10110010011100101001000111101001;
		b = 32'b01101100010101111110110001100001;
		correct = 32'b01101100010101111110110001100001;
		#400 //-1.411943e-08 * 1.0441413e+27 = 1.0441413e+27
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10000010101110111010000101000011;
		b = 32'b00000001010001011010000101010101;
		correct = 32'b10000010101000101110110100011000;
		#400 //-2.756974e-37 * 3.6298936e-38 = -2.3939846e-37
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00111000110001101000110110101011;
		b = 32'b00110100001111001001001101110001;
		correct = 32'b00111000110001101110101111110101;
		#400 //9.4677634e-05 * 1.7562503e-07 = 9.485326e-05
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10010110010011111011001000110101;
		b = 32'b11011001100000000000100101100010;
		correct = 32'b11011001100000000000100101100010;
		#400 //-1.6777559e-25 * -4504889000000000.0 = -4504889000000000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00101100100101110111111011010100;
		b = 32'b10010011010111010101000101101001;
		correct = 32'b00101100100101110111111011010100;
		#400 //4.305759e-12 * -2.793426e-27 = 4.305759e-12
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11111000110111101000100010001111;
		b = 32'b01010011101111110101101100111110;
		correct = 32'b11111000110111101000100010001111;
		#400 //-3.6108114e+34 * 1643739100000.0 = -3.6108114e+34
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01001001100000000000010101101111;
		b = 32'b01100111101010001011010011000010;
		correct = 32'b01100111101010001011010011000010;
		#400 //1048749.9 * 1.5933839e+24 = 1.5933839e+24
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00000010100111110111001001011001;
		b = 32'b11010001010111100101110110001001;
		correct = 32'b11010001010111100101110110001001;
		#400 //2.3428583e-37 * -59690750000.0 = -59690750000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00101101001110101101111110010011;
		b = 32'b01111001111010001010101011100110;
		correct = 32'b01111001111010001010101011100110;
		#400 //1.0622519e-11 * 1.5100989e+35 = 1.5100989e+35
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00001000110001101110010011111100;
		b = 32'b00110011000010000110100100011101;
		correct = 32'b00110011000010000110100100011101;
		#400 //1.19705255e-33 * 3.1760568e-08 = 3.1760568e-08
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11110111101111001100011101110111;
		b = 32'b00000001100110010111001011011010;
		correct = 32'b11110111101111001100011101110111;
		#400 //-7.6577925e+33 * 5.636813e-38 = -7.6577925e+33
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11101101100011010100011011000010;
		b = 32'b10101000011100011101111100111001;
		correct = 32'b11101101100011010100011011000010;
		#400 //-5.465366e+27 * -1.3426591e-14 = -5.465366e+27
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00101100101100000000110101001001;
		b = 32'b11110000101101001011110010110001;
		correct = 32'b11110000101101001011110010110001;
		#400 //5.003696e-12 * -4.4748333e+29 = -4.4748333e+29
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10110110110101000011100011001111;
		b = 32'b10101100001010001000111000101111;
		correct = 32'b10110110110101000011100011010100;
		#400 //-6.3247057e-06 * -2.3953164e-12 = -6.324708e-06
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11010110011000010100000101111001;
		b = 32'b11100010101100110100011010010100;
		correct = 32'b11100010101100110100011010010100;
		#400 //-61917830000000.0 * -1.6535264e+21 = -1.6535264e+21
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01000100111010000111110000110111;
		b = 32'b11010000011110000110011000101011;
		correct = 32'b11010000011110000110011000101001;
		#400 //1859.8817 * -16669781000.0 = -16669779000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00011111001111111001100011011110;
		b = 32'b01110110100011100000011010101010;
		correct = 32'b01110110100011100000011010101010;
		#400 //4.0572272e-20 * 1.440315e+33 = 1.440315e+33
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01101000110010110110011010101011;
		b = 32'b11000100001111011011011101010110;
		correct = 32'b01101000110010110110011010101011;
		#400 //7.684274e+24 * -758.8646 = 7.684274e+24
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10001100010000011100011111101111;
		b = 32'b10011011001011111011000010101011;
		correct = 32'b10011011001011111011000010101011;
		#400 //-1.4928344e-31 * -1.4532745e-22 = -1.4532745e-22
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11101111110000011001101010010110;
		b = 32'b01011010000000001011001110001100;
		correct = 32'b11101111110000011001101010010110;
		#400 //-1.1983498e+29 * 9056553000000000.0 = -1.1983498e+29
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11010000101011010111110000101101;
		b = 32'b10011101111011010010001001111010;
		correct = 32'b11010000101011010111110000101101;
		#400 //-23284770000.0 * -6.2769026e-21 = -23284770000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11100110101101100001111111011101;
		b = 32'b10010011001110100010000101010000;
		correct = 32'b11100110101101100001111111011101;
		#400 //-4.3002924e+23 * -2.3492925e-27 = -4.3002924e+23
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01110010010100100001101110000010;
		b = 32'b01110100000110101111001110011000;
		correct = 32'b01110100001010000001010101010000;
		#400 //4.1616068e+30 * 4.9106103e+31 = 5.326771e+31
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10001000101111011011001010000011;
		b = 32'b00011000000101111101010101010000;
		correct = 32'b00011000000101111101010101010000;
		#400 //-1.1416992e-33 * 1.9623988e-24 = 1.9623988e-24
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10111100011111101111101010000010;
		b = 32'b01100000111010110110011011100101;
		correct = 32'b01100000111010110110011011100101;
		#400 //-0.015562655 * 1.35699975e+20 = 1.35699975e+20
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01001001010011100110001100010111;
		b = 32'b00001010011101000101001011010000;
		correct = 32'b01001001010011100110001100010111;
		#400 //845361.44 * 1.1763748e-32 = 845361.44
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11011100100101000010110010111101;
		b = 32'b11101001100010000001101110010101;
		correct = 32'b11101001100010000001101110010101;
		#400 //-3.336599e+17 * -2.056802e+25 = -2.056802e+25
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11001110001011011101000100011010;
		b = 32'b11000111010010011001111011110110;
		correct = 32'b11001110001011011101010001000000;
		#400 //-729040500.0 * -51614.96 = -729092100.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01111110011011110110101001001011;
		b = 32'b11001001111110001101011100101110;
		correct = 32'b01111110011011110110101001001011;
		#400 //7.955935e+37 * -2038501.8 = 7.955935e+37
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11010011100010100011000011111100;
		b = 32'b10010100110111011100100101010111;
		correct = 32'b11010011100010100011000011111100;
		#400 //-1187054600000.0 * -2.2394712e-26 = -1187054600000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01101000000011101110011001101110;
		b = 32'b00111011000010010100110111101010;
		correct = 32'b01101000000011101110011001101110;
		#400 //2.699307e+24 * 0.0020950981 = 2.699307e+24
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00010111111001111000111111101111;
		b = 32'b11010010110011010101001000001111;
		correct = 32'b11010010110011010101001000001111;
		#400 //1.4964359e-24 * -440922500000.0 = -440922500000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11010001110010100000100111001100;
		b = 32'b01110010011101100110011001101110;
		correct = 32'b01110010011101100110011001101110;
		#400 //-108468470000.0 * 4.880457e+30 = 4.880457e+30
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10011010100100010010110001010110;
		b = 32'b10010111101010000100100100100000;
		correct = 32'b10011010100100111100110101111010;
		#400 //-6.004222e-23 * -1.0875205e-24 = -6.112974e-23
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11010011100010100111101101110110;
		b = 32'b10010011010001101100011111011110;
		correct = 32'b11010011100010100111101101110110;
		#400 //-1189553600000.0 * -2.5089656e-27 = -1189553600000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00100100111001000001110111010111;
		b = 32'b11101110000101011011101010010110;
		correct = 32'b11101110000101011011101010010110;
		#400 //9.892979e-17 * -1.1584709e+28 = -1.1584709e+28
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11101110110011111101101110000000;
		b = 32'b11110101100101101100101001011101;
		correct = 32'b11110101100101101100110110011100;
		#400 //-3.2164378e+28 * -3.822993e+32 = -3.8233144e+32
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01010010011010110100011101001111;
		b = 32'b01010101010101010111101111000010;
		correct = 32'b01010101010110010010100011011111;
		#400 //252628420000.0 * 14670470000000.0 = 14923098000000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10111001011101010110001010110101;
		b = 32'b11010001010011011010000110101001;
		correct = 32'b11010001010011011010000110101001;
		#400 //-0.00023401792 * -55198780000.0 = -55198780000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11000100100010100010101010111011;
		b = 32'b01101100100100111000001011100110;
		correct = 32'b01101100100100111000001011100110;
		#400 //-1105.3353 * 1.426642e+27 = 1.426642e+27
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00100001010101110101010000010000;
		b = 32'b00001110011011101010011010001111;
		correct = 32'b00100001010101110101010000010000;
		#400 //7.295609e-19 * 2.941596e-30 = 7.295609e-19
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10011110100011100011111100101100;
		b = 32'b00111010000111111000111011000011;
		correct = 32'b00111010000111111000111011000011;
		#400 //-1.5060962e-20 * 0.0006086642 = 0.0006086642
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11011011001101101101010011101000;
		b = 32'b10010101000111100110101111101110;
		correct = 32'b11011011001101101101010011101000;
		#400 //-5.146254e+16 * -3.1992987e-26 = -5.146254e+16
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01011101010001011000100011111001;
		b = 32'b01111011001000111101100010101010;
		correct = 32'b01111011001000111101100010101010;
		#400 //8.896188e+17 * 8.5073886e+35 = 8.5073886e+35
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11010100101111100101101100010011;
		b = 32'b00011000100010010010011011111111;
		correct = 32'b11010100101111100101101100010011;
		#400 //-6540574000000.0 * 3.5453046e-24 = -6540574000000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11000000110110110101011111110011;
		b = 32'b11010101000001101110011111101010;
		correct = 32'b11010101000001101110011111101010;
		#400 //-6.854486 * -9270664000000.0 = -9270664000000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11011101110100001101001111101110;
		b = 32'b10100010010011000001101101100110;
		correct = 32'b11011101110100001101001111101110;
		#400 //-1.880954e+18 * -2.766166e-18 = -1.880954e+18
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10101011100001001000010001100110;
		b = 32'b00110101001011011010100010111010;
		correct = 32'b00110101001011011010100010101001;
		#400 //-9.415912e-13 * 6.469305e-07 = 6.4692955e-07
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10100011101100101110110001101011;
		b = 32'b11001001100000001110001100000101;
		correct = 32'b11001001100000001110001100000101;
		#400 //-1.9398926e-17 * -1055840.6 = -1055840.6
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11010000010101001011011010100001;
		b = 32'b00101100000111001100011000111101;
		correct = 32'b11010000010101001011011010100001;
		#400 //-14274954000.0 * 2.2278978e-12 = -14274954000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11010111110001011010111000011111;
		b = 32'b00000011111000100001000101100010;
		correct = 32'b11010111110001011010111000011111;
		#400 //-434703270000000.0 * 1.3287077e-36 = -434703270000000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10010001011000101111011000000101;
		b = 32'b00100011000110111000001011100001;
		correct = 32'b00100011000110111000001011100001;
		#400 //-1.7904067e-28 * 8.4302815e-18 = 8.4302815e-18
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01110111111101011110111111111000;
		b = 32'b10001001101101010001000010000011;
		correct = 32'b01110111111101011110111111111000;
		#400 //9.976405e+33 * -4.3589693e-33 = 9.976405e+33
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10111101000100010111100100101110;
		b = 32'b10000101101101000101100110111011;
		correct = 32'b10111101000100010111100100101110;
		#400 //-0.035515957 * -1.696008e-35 = -0.035515957
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00111001011001111001100010000000;
		b = 32'b01101111001110001100100110000111;
		correct = 32'b01101111001110001100100110000111;
		#400 //0.00022086687 * 5.7188873e+28 = 5.7188873e+28
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10010011100100001000110001110111;
		b = 32'b10011000110000101011101011101001;
		correct = 32'b10011000110000101101111100001100;
		#400 //-3.648922e-27 * -5.0336556e-24 = -5.0373044e-24
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01100100010111111110001110101111;
		b = 32'b01001000000010011100100010001010;
		correct = 32'b01100100010111111110001110101111;
		#400 //1.6520121e+22 * 141090.16 = 1.6520121e+22
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01100010010000010001111101100101;
		b = 32'b10101000101001000000111010101011;
		correct = 32'b01100010010000010001111101100101;
		#400 //8.9062096e+20 * -1.8214019e-14 = 8.9062096e+20
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01101110100011110000110000000110;
		b = 32'b11111110100111101001110011011001;
		correct = 32'b11111110100111101001110011011001;
		#400 //2.2135446e+28 * -1.0541621e+38 = -1.0541621e+38
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11110010001001000011010110001101;
		b = 32'b01001110100011011010000001011101;
		correct = 32'b11110010001001000011010110001101;
		#400 //-3.252498e+30 * 1188048500.0 = -3.252498e+30
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10010110011011000110000001110011;
		b = 32'b10111000001001011000011001010101;
		correct = 32'b10111000001001011000011001010101;
		#400 //-1.9094362e-25 * -3.9464172e-05 = -3.9464172e-05
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10101110110100000100110111110100;
		b = 32'b10010001010110100000001111111101;
		correct = 32'b10101110110100000100110111110100;
		#400 //-9.472592e-11 * -1.7198397e-28 = -9.472592e-11
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01111000100111010000100101100111;
		b = 32'b10100010111110110010101100110001;
		correct = 32'b01111000100111010000100101100111;
		#400 //2.5480666e+34 * -6.8079417e-18 = 2.5480666e+34
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11100111011011110000010011110101;
		b = 32'b00101011100010101110010111011010;
		correct = 32'b11100111011011110000010011110101;
		#400 //-1.128737e+24 * 9.869286e-13 = -1.128737e+24
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10101001100110101100101110011001;
		b = 32'b10010101011011000010000111111111;
		correct = 32'b10101001100110101100101110011001;
		#400 //-6.8742924e-14 * -4.768664e-26 = -6.8742924e-14
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10001001010110010100100110111011;
		b = 32'b10100110110111000010100101010101;
		correct = 32'b10100110110111000010100101010101;
		#400 //-2.6155093e-33 * -1.527677e-15 = -1.527677e-15
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00001100000110100101111011100001;
		b = 32'b11010000100111001110111111100110;
		correct = 32'b11010000100111001110111111100110;
		#400 //1.189228e-31 * -21063741000.0 = -21063741000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00100111101110111101010101111001;
		b = 32'b10111101111111010011010000111101;
		correct = 32'b10111101111111010011010000111101;
		#400 //5.2134374e-15 * -0.12363479 = -0.12363479
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00011011111111001101101110000011;
		b = 32'b11111110000010000100100110100100;
		correct = 32'b11111110000010000100100110100100;
		#400 //4.183176e-22 * -4.5289343e+37 = -4.5289343e+37
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00100011001100100111000100011011;
		b = 32'b00001001111111101010110011011000;
		correct = 32'b00100011001100100111000100011011;
		#400 //9.67335e-18 * 6.1310817e-33 = 9.67335e-18
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01001111011100110000001011011000;
		b = 32'b01101110000010110101110100000110;
		correct = 32'b01101110000010110101110100000110;
		#400 //4077049900.0 * 1.0782719e+28 = 1.0782719e+28
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01101011000001100010010011101100;
		b = 32'b11111011011000111010011001100011;
		correct = 32'b11111011011000111010011001100011;
		#400 //1.6217042e+26 * -1.1820261e+36 = -1.1820261e+36
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00101000000010011101010100100100;
		b = 32'b10100000111001001000000011000001;
		correct = 32'b00101000000010011101001101011011;
		#400 //7.651245e-15 * -3.8709905e-19 = 7.650858e-15
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01011110000110100011011000100010;
		b = 32'b01101110001101101101101001110011;
		correct = 32'b01101110001101101101101001110011;
		#400 //2.7780266e+18 * 1.414759e+28 = 1.414759e+28
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01111111111011011100011100010000;
		b = 32'b01111001110111100110011010111110;
		correct = 32'b01111111111011011100011100010000;
		#400 //nan * 1.4434672e+35 = nan
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00100000100100010001011011010100;
		b = 32'b11011000101110101111000001000001;
		correct = 32'b11011000101110101111000001000001;
		#400 //2.4579062e-19 * -1644328400000000.0 = -1644328400000000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00011010011000010001110111000010;
		b = 32'b01000111110011100111000111000110;
		correct = 32'b01000111110011100111000111000110;
		#400 //4.6552948e-23 * 105699.55 = 105699.55
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00010011110111110010000101111010;
		b = 32'b01010010110110000110011001101011;
		correct = 32'b01010010110110000110011001101011;
		#400 //5.6326125e-27 * 464715600000.0 = 464715600000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11101001000011011111011111111111;
		b = 32'b01010110000010011101000111111110;
		correct = 32'b11101001000011011111011111111111;
		#400 //-1.0726854e+25 * 37883750000000.0 = -1.0726854e+25
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11010111100011110101100001110110;
		b = 32'b00111101100011001101101001000100;
		correct = 32'b11010111100011110101100001110110;
		#400 //-315220200000000.0 * 0.06877568 = -315220200000000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01101101100111000011011011110110;
		b = 32'b00001011010110010110101011001101;
		correct = 32'b01101101100111000011011011110110;
		#400 //6.043263e+27 * 4.1873028e-32 = 6.043263e+27
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01001110011010110101101001011011;
		b = 32'b00110000111100110001101101111010;
		correct = 32'b01001110011010110101101001011011;
		#400 //987141800.0 * 1.7688386e-09 = 987141800.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01010111101111101101011010111110;
		b = 32'b10010110011011101000011000000111;
		correct = 32'b01010111101111101101011010111110;
		#400 //419659040000000.0 * -1.9267778e-25 = 419659040000000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01101101011110101111011000101111;
		b = 32'b10100111101101111000000010000100;
		correct = 32'b01101101011110101111011000101111;
		#400 //4.8543044e+27 * -5.093204e-15 = 4.8543044e+27
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11111101010011011010010110110010;
		b = 32'b00111101010110011001001100010011;
		correct = 32'b11111101010011011010010110110010;
		#400 //-1.7084505e+37 * 0.053118777 = -1.7084505e+37
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00111111010010110100001011000110;
		b = 32'b10110000000010010000111011110100;
		correct = 32'b00111111010010110100001011000110;
		#400 //0.79398763 * -4.986156e-10 = 0.79398763
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01110011010101100010011110100111;
		b = 32'b11111000101011101100101111000000;
		correct = 32'b11111000101011101011000011111011;
		#400 //1.6967099e+31 * -2.8362256e+34 = -2.834529e+34
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00100011111000101010011101100101;
		b = 32'b01000001000100110101010010110011;
		correct = 32'b01000001000100110101010010110011;
		#400 //2.4573863e-17 * 9.2081785 = 9.2081785
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00111111001010100011110000110111;
		b = 32'b01100100110011001000101101101111;
		correct = 32'b01100100110011001000101101101111;
		#400 //0.6649813 * 3.0185464e+22 = 3.0185464e+22
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01100011000000101101110110011000;
		b = 32'b01011100001101011000101000000000;
		correct = 32'b01100011000000101110000001101110;
		#400 //2.4140442e+21 * 2.0439481e+17 = 2.4142486e+21
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10001010010101100110101010111010;
		b = 32'b00011101101100010001011111100000;
		correct = 32'b00011101101100010001011111100000;
		#400 //-1.0323798e-32 * 4.6876196e-21 = 4.6876196e-21
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10101110000100100000101110011110;
		b = 32'b11001101010110101000101010001001;
		correct = 32'b11001101010110101000101010001001;
		#400 //-3.3206875e-11 * -229157010.0 = -229157010.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00110010101000100100101111110001;
		b = 32'b00010111101110110101110111111000;
		correct = 32'b00110010101000100100101111110001;
		#400 //1.8893816e-08 * 1.2108313e-24 = 1.8893816e-08
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10001111010111000000000010100010;
		b = 32'b00110110100001001011011110010000;
		correct = 32'b00110110100001001011011110010000;
		#400 //-1.0846959e-29 * 3.955276e-06 = 3.955276e-06
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10000100101000000000101101101001;
		b = 32'b11011011001111110001010001101110;
		correct = 32'b11011011001111110001010001101110;
		#400 //-3.7626298e-36 * -5.3784183e+16 = -5.3784183e+16
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01000111011000001111101010001010;
		b = 32'b11100001100010001010101011000100;
		correct = 32'b11100001100010001010101011000100;
		#400 //57594.54 * -3.1513277e+20 = -3.1513277e+20
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10110100101001010000111111110101;
		b = 32'b00011000011100000101010001011100;
		correct = 32'b10110100101001010000111111110101;
		#400 //-3.0745255e-07 * 3.1061864e-24 = -3.0745255e-07
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10001000011100000000010110011100;
		b = 32'b00000001000011000101010000100000;
		correct = 32'b10001000011100000000001101101011;
		#400 //-7.2228967e-34 * 2.5774296e-38 = -7.222639e-34
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11111111000000101100011010100010;
		b = 32'b11000111010101011000000100111110;
		correct = 32'b11111111000000101100011010100010;
		#400 //-1.73831e+38 * -54657.242 = -1.73831e+38
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00010010111001001001010000001101;
		b = 32'b10110111111101000001000111100001;
		correct = 32'b10110111111101000001000111100001;
		#400 //1.442532e-27 * -2.9095392e-05 = -2.9095392e-05
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00100011100011001010001110010100;
		b = 32'b10000110000100011000010100001001;
		correct = 32'b00100011100011001010001110010100;
		#400 //1.5248108e-17 * -2.7369208e-35 = 1.5248108e-17
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10001010010110011111101100111010;
		b = 32'b10010111001000100110110000001110;
		correct = 32'b10010111001000100110110000001110;
		#400 //-1.04954204e-32 * -5.2481407e-25 = -5.2481407e-25
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10010010010010001010100000100100;
		b = 32'b11001001000011110111101110111011;
		correct = 32'b11001001000011110111101110111011;
		#400 //-6.331612e-28 * -587707.7 = -587707.7
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00111000111010110111001101111000;
		b = 32'b00101001111001001100000100000111;
		correct = 32'b00111000111010110111001101111000;
		#400 //0.00011227181 * 1.0158719e-13 = 0.00011227181
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00101011010000101111010101101110;
		b = 32'b11100000011011111011010111011111;
		correct = 32'b11100000011011111011010111011111;
		#400 //6.926325e-13 * -6.909183e+19 = -6.909183e+19
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10100100001011111100011001100000;
		b = 32'b10010010010000110000001101110001;
		correct = 32'b10100100001011111100011001100000;
		#400 //-3.8115106e-17 * -6.1535392e-28 = -3.8115106e-17
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01000101100110100001100000110001;
		b = 32'b01101101010001010100111100111010;
		correct = 32'b01101101010001010100111100111010;
		#400 //4931.024 * 3.8165204e+27 = 3.8165204e+27
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01101000011111001100000111111100;
		b = 32'b11001001111010111110100110101010;
		correct = 32'b01101000011111001100000111111100;
		#400 //4.774459e+24 * -1932597.2 = 4.774459e+24
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01011011011100011110110100000001;
		b = 32'b10110011101111000001101010000000;
		correct = 32'b01011011011100011110110100000001;
		#400 //6.809606e+16 * -8.7592525e-08 = 6.809606e+16
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10110110100101111010111010000100;
		b = 32'b00110101110011111111111001001111;
		correct = 32'b10110110010001110101110111100000;
		#400 //-4.520467e-06 * 1.5496715e-06 = -2.9707953e-06
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11001110011000011001010001000000;
		b = 32'b00111001001110110011100010100100;
		correct = 32'b11001110011000011001010001000000;
		#400 //-946147300.0 * 0.0001785481 = -946147300.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11010111100100011001001100011101;
		b = 32'b11000101110100100001101111000110;
		correct = 32'b11010111100100011001001100011101;
		#400 //-320122070000000.0 * -6723.4717 = -320122070000000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10000110000011110001110011100011;
		b = 32'b00110100101010010000110010111011;
		correct = 32'b00110100101010010000110010111011;
		#400 //-2.6916533e-35 * 3.1487966e-07 = 3.1487966e-07
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10111011010111001000010101000111;
		b = 32'b00010100000001111111100111000000;
		correct = 32'b10111011010111001000010101000111;
		#400 //-0.0033648775 * 6.865013e-27 = -0.0033648775
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01011010111101101111110011101110;
		b = 32'b01110101101101100010010010100101;
		correct = 32'b01110101101101100010010010100101;
		#400 //3.4760472e+16 * 4.6178773e+32 = 4.6178773e+32
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01011101110001000000001011011001;
		b = 32'b11110010110111011001001110100001;
		correct = 32'b11110010110111011001001110100001;
		#400 //1.7655112e+18 * -8.7775564e+30 = -8.7775564e+30
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00111101100111100001010010110100;
		b = 32'b01001110011000001010101111011001;
		correct = 32'b01001110011000001010101111011001;
		#400 //0.077187926 * 942339650.0 = 942339650.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11110011011101100100111101001011;
		b = 32'b00110001001100101001001010000000;
		correct = 32'b11110011011101100100111101001011;
		#400 //-1.9514668e+31 * 2.5985685e-09 = -1.9514668e+31
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10010101100001100111111100010101;
		b = 32'b11100010111101011111101011111101;
		correct = 32'b11100010111101011111101011111101;
		#400 //-5.432267e-26 * -2.268769e+21 = -2.268769e+21
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01100101101110110101111111110011;
		b = 32'b11011110001000011010100010111100;
		correct = 32'b01100101101110110101111010110000;
		#400 //1.1060656e+23 * -2.9121918e+18 = 1.1060365e+23
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11000111001011011100010111101110;
		b = 32'b00111010111110110011100000101110;
		correct = 32'b11000111001011011100010111101110;
		#400 //-44485.93 * 0.0019166523 = -44485.93
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01011111110000001001101110011101;
		b = 32'b11110001110110101100101101011010;
		correct = 32'b11110001110110101100101101011010;
		#400 //2.7757719e+19 * -2.1668342e+30 = -2.1668342e+30
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00110100001111101110100010010100;
		b = 32'b00000110011101101011110101111000;
		correct = 32'b00110100001111101110100010010100;
		#400 //1.777974e-07 * 4.6406657e-35 = 1.777974e-07
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00011101111101000001111010111111;
		b = 32'b00111010100100010010100011111111;
		correct = 32'b00111010100100010010100011111111;
		#400 //6.4618053e-21 * 0.001107484 = 0.001107484
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01000011000011110110100011011110;
		b = 32'b10001010001101110000000011101000;
		correct = 32'b01000011000011110110100011011110;
		#400 //143.40964 * -8.8113e-33 = 143.40964
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01010000101111011110111111011001;
		b = 32'b00001110100101011110110011010110;
		correct = 32'b01010000101111011110111111011001;
		#400 //25492900000.0 * 3.69594e-30 = 25492900000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01100010110010010001100010100000;
		b = 32'b10110000111100001111111101101010;
		correct = 32'b01100010110010010001100010100000;
		#400 //1.854785e+21 * -1.7534891e-09 = 1.854785e+21
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01010110001010000001010000110011;
		b = 32'b01001011011011110000100010001011;
		correct = 32'b01010110001010000001010000110111;
		#400 //46201177000000.0 * 15665291.0 = 46201194000000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00011010001100110111101111000010;
		b = 32'b11010110011111101111001111001100;
		correct = 32'b11010110011111101111001111001100;
		#400 //3.7116303e-23 * -70080763000000.0 = -70080763000000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10001110101100010000101110100001;
		b = 32'b10010110101000100101111110000001;
		correct = 32'b10010110101000100110000000110010;
		#400 //-4.3645067e-30 * -2.6232783e-25 = -2.623322e-25
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11101100010000010111010110000101;
		b = 32'b01111000001110100100100000010001;
		correct = 32'b01111000001110100100100000010000;
		#400 //-9.355106e+26 * 1.5112952e+34 = 1.511295e+34
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00001101110101010001101111100110;
		b = 32'b00110110011101100100001010000011;
		correct = 32'b00110110011101100100001010000011;
		#400 //1.3133855e-30 * 3.6695571e-06 = 3.6695571e-06
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10010101111011111101111001101000;
		b = 32'b00110000001110111100110001110110;
		correct = 32'b00110000001110111100110001110110;
		#400 //-9.6882226e-26 * 6.832076e-10 = 6.832076e-10
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11110011001111100110111001100000;
		b = 32'b00000100000001111011101111110000;
		correct = 32'b11110011001111100110111001100000;
		#400 //-1.508751e+31 * 1.595547e-36 = -1.508751e+31
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10010101010010010101000011110010;
		b = 32'b01011111101110011011111100011100;
		correct = 32'b01011111101110011011111100011100;
		#400 //-4.065548e-26 * 2.6768895e+19 = 2.6768895e+19
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00001010101010111011111001111101;
		b = 32'b11011010100011110110011001101100;
		correct = 32'b11011010100011110110011001101100;
		#400 //1.6538355e-32 * -2.0181768e+16 = -2.0181768e+16
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01011001111110100010101110010100;
		b = 32'b01111111001111100001110010001000;
		correct = 32'b01111111001111100001110010001000;
		#400 //8802082400000000.0 * 2.5270146e+38 = 2.5270146e+38
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00011010110011101101000011101111;
		b = 32'b00100110001000001000011011101110;
		correct = 32'b00100110001000001000011011110000;
		#400 //8.5537154e-23 * 5.5694015e-16 = 5.5694026e-16
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00001000111110000101101010110111;
		b = 32'b01101101110001000100110000010001;
		correct = 32'b01101101110001000100110000010001;
		#400 //1.4947284e-33 * 7.5938776e+27 = 7.5938776e+27
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01011010001110011101011100101111;
		b = 32'b01101100010101111000001010101001;
		correct = 32'b01101100010101111000001010101001;
		#400 //1.3077367e+16 * 1.0421443e+27 = 1.0421443e+27
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11100000100110000101111000001110;
		b = 32'b01001001000110111000100101000000;
		correct = 32'b11100000100110000101111000001110;
		#400 //-8.783383e+19 * 637076.0 = -8.783383e+19
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00001101100001100111001000110110;
		b = 32'b00111011010100110110110111000101;
		correct = 32'b00111011010100110110110111000101;
		#400 //8.285883e-31 * 0.0032261473 = 0.0032261473
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10101110000101001010001000111011;
		b = 32'b00110111010001100111011100101001;
		correct = 32'b00110111010001100111011100000100;
		#400 //-3.3795394e-11 * 1.1829464e-05 = 1.182943e-05
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00100100000101010000101111001100;
		b = 32'b01101011001110110101110000010111;
		correct = 32'b01101011001110110101110000010111;
		#400 //3.2319217e-17 * 2.2650401e+26 = 2.2650401e+26
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01000111111011010101100011111100;
		b = 32'b11010001000101001010011110001000;
		correct = 32'b11010001000101001010011101101010;
		#400 //121521.97 * -39904117000.0 = -39903994000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11011010110100011011101100001000;
		b = 32'b00100101001010100010001001010001;
		correct = 32'b11011010110100011011101100001000;
		#400 //-2.9516957e+16 * 1.4756776e-16 = -2.9516957e+16
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00010010100101101010010110100011;
		b = 32'b11110100110110010110100111111100;
		correct = 32'b11110100110110010110100111111100;
		#400 //9.507163e-28 * -1.3780249e+32 = -1.3780249e+32
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11010101000010010100111100010101;
		b = 32'b00111111101110000110010011001000;
		correct = 32'b11010101000010010100111100010101;
		#400 //-9435797000000.0 * 1.4405756 = -9435797000000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00011000000011011011101100100011;
		b = 32'b10100111010111101110000110100001;
		correct = 32'b10100111010111101110000110100001;
		#400 //1.8318303e-24 * -3.0931003e-15 = -3.0931003e-15
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10010110111101110101000101101110;
		b = 32'b11111010000101101111011000101110;
		correct = 32'b11111010000101101111011000101110;
		#400 //-3.9956392e-25 * -1.9595941e+35 = -1.9595941e+35
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00000011000110000110101010000101;
		b = 32'b11001110100100100001110001000100;
		correct = 32'b11001110100100100001110001000100;
		#400 //4.4791064e-37 * -1225663000.0 = -1225663000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00010110010011110001000100111000;
		b = 32'b10110001101110010001010111111101;
		correct = 32'b10110001101110010001010111111101;
		#400 //1.672676e-25 * -5.3867084e-09 = -5.3867084e-09
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11110001110011001111100111101100;
		b = 32'b10011010110011111010101101000111;
		correct = 32'b11110001110011001111100111101100;
		#400 //-2.0299865e+30 * -8.588991e-23 = -2.0299865e+30
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00110111001111011100001110100001;
		b = 32'b01101010000110100000010010101001;
		correct = 32'b01101010000110100000010010101001;
		#400 //1.1310826e-05 * 4.6549146e+25 = 4.6549146e+25
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11011100101110110101100001000101;
		b = 32'b11011001101011110100101101010110;
		correct = 32'b11011100101111100001010101110010;
		#400 //-4.21863e+17 * -6167619000000000.0 = -4.280306e+17
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11001011000001110001110111100111;
		b = 32'b10000100010101100011011100111111;
		correct = 32'b11001011000001110001110111100111;
		#400 //-8855015.0 * -2.5180947e-36 = -8855015.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11011000100000000111010111110001;
		b = 32'b11101110111000010010000110010100;
		correct = 32'b11101110111000010010000110010100;
		#400 //-1129952300000000.0 * -3.483736e+28 = -3.483736e+28
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00111111111010011110101001000001;
		b = 32'b00111110001101010111111010100011;
		correct = 32'b01000000000000000100110100001011;
		#400 //1.8274614 * 0.1772409 = 2.0047023
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00100000101100010000111000011101;
		b = 32'b10110001110011000011001111101100;
		correct = 32'b10110001110011000011001111101100;
		#400 //2.9994306e-19 * -5.9430842e-09 = -5.9430842e-09
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00101110111011110000001011001111;
		b = 32'b00101111000110011111110011011000;
		correct = 32'b00101111100010001011111100100000;
		#400 //1.08689606e-10 * 1.4005097e-10 = 2.4874058e-10
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01000011101011101110000010010100;
		b = 32'b11111010111111100110000011011000;
		correct = 32'b11111010111111100110000011011000;
		#400 //349.75452 * -6.604038e+35 = -6.604038e+35
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00111101001000100101011111010000;
		b = 32'b11000011100010000010000000111011;
		correct = 32'b11000011100010000001101100101000;
		#400 //0.039634526 * -272.2518 = -272.21216
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11110010000011000110111011110100;
		b = 32'b00000111001101011011000110010000;
		correct = 32'b11110010000011000110111011110100;
		#400 //-2.7815703e+30 * 1.3669107e-34 = -2.7815703e+30
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00000100101001101111111100000111;
		b = 32'b10010000001111001010001100110000;
		correct = 32'b10010000001111001010001100101111;
		#400 //3.9260618e-36 * -3.7202178e-29 = -3.7202175e-29
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01101010111000011001100011100011;
		b = 32'b01000111000111110010011010011001;
		correct = 32'b01101010111000011001100011100011;
		#400 //1.3636515e+26 * 40742.598 = 1.3636515e+26
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01101111110111111111101100100100;
		b = 32'b10101001001111010001110100100110;
		correct = 32'b01101111110111111111101100100100;
		#400 //1.38637535e+29 * -4.1991713e-14 = 1.38637535e+29
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11010001010100011110100010001010;
		b = 32'b01110111010111000111110100111110;
		correct = 32'b01110111010111000111110100111110;
		#400 //-56346845000.0 * 4.4720528e+33 = 4.4720528e+33
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01101101010110100110110011111100;
		b = 32'b00111110011110000011100000001100;
		correct = 32'b01101101010110100110110011111100;
		#400 //4.224968e+27 * 0.2424013 = 4.224968e+27
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11100001101001001100010011111111;
		b = 32'b10110001001011000101001000100110;
		correct = 32'b11100001101001001100010011111111;
		#400 //-3.7993264e+20 * -2.507599e-09 = -3.7993264e+20
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11100010001010010111000000010101;
		b = 32'b10001000101001110011000100011000;
		correct = 32'b11100010001010010111000000010101;
		#400 //-7.81394e+20 * -1.0062489e-33 = -7.81394e+20
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11000101000000100110010110011000;
		b = 32'b01001110100100011001110011010001;
		correct = 32'b01001110100100011001110011000001;
		#400 //-2086.3496 * 1221486700.0 = 1221484700.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01111010011110100110100001011111;
		b = 32'b01111100001001001110001101100000;
		correct = 32'b01111100001101001000100111100110;
		#400 //3.2504778e+35 * 3.4245936e+36 = 3.7496414e+36
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10010100111001001011010000011111;
		b = 32'b11110101000100001101110000010000;
		correct = 32'b11110101000100001101110000010000;
		#400 //-2.3093162e-26 * -1.8363138e+32 = -1.8363138e+32
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00100101010110011010110010110010;
		b = 32'b11100111010101011011000001101111;
		correct = 32'b11100111010101011011000001101111;
		#400 //1.8880261e-16 * -1.0091187e+24 = -1.0091187e+24
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01000010101110011011010111110110;
		b = 32'b11111101011001101000000100100111;
		correct = 32'b11111101011001101000000100100111;
		#400 //92.85539 * -1.9149565e+37 = -1.9149565e+37
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10001001011011000111000111011101;
		b = 32'b01010010100100111110110111010101;
		correct = 32'b01010010100100111110110111010101;
		#400 //-2.8461005e-33 * 317675180000.0 = 317675180000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11110010000110111110001111010100;
		b = 32'b11000000001011010100101011100100;
		correct = 32'b11110010000110111110001111010100;
		#400 //-3.0877186e+30 * -2.707696 = -3.0877186e+30
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01010000100000110110001101011100;
		b = 32'b01111011100110111010011101011010;
		correct = 32'b01111011100110111010011101011010;
		#400 //17634615000.0 * 1.6164006e+36 = 1.6164006e+36
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01101111001010011111001111110100;
		b = 32'b10111001111011110110100011010001;
		correct = 32'b01101111001010011111001111110100;
		#400 //5.259789e+28 * -0.00045663727 = 5.259789e+28
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10100100100101111110010011001001;
		b = 32'b01001110010011010101010111101100;
		correct = 32'b01001110010011010101010111101100;
		#400 //-6.587339e-17 * 861240060.0 = 861240060.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01000110010110111000101100111110;
		b = 32'b11111111111000100101100010101001;
		correct = 32'b11111111111000100101100010101001;
		#400 //14050.811 * nan = nan
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00001000011110011011000111010001;
		b = 32'b01100000011101010110011100011111;
		correct = 32'b01100000011101010110011100011111;
		#400 //7.5139734e-34 * 7.0732546e+19 = 7.0732546e+19
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10111101011101110001101111111110;
		b = 32'b00100100101110011101011100101000;
		correct = 32'b10111101011101110001101111111110;
		#400 //-0.06032943 * 8.059545e-17 = -0.06032943
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11101100100110111101010100011101;
		b = 32'b01101000111000110010011110000000;
		correct = 32'b11101100100110101111000111110110;
		#400 //-1.5071192e+27 * 8.5816467e+24 = -1.4985376e+27
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01010110001100111110010001111100;
		b = 32'b11100100110000010000100101011011;
		correct = 32'b11100100110000010000100101011011;
		#400 //49448480000000.0 * -2.8487166e+22 = -2.8487166e+22
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11011101101000100001010010110100;
		b = 32'b11001111111100000110001100101010;
		correct = 32'b11011101101000100001010010110100;
		#400 //-1.4598947e+18 * -8066061300.0 = -1.4598947e+18
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11110110001011000010011111100000;
		b = 32'b10100100100011100111000110011101;
		correct = 32'b11110110001011000010011111100000;
		#400 //-8.729334e+32 * -6.177515e-17 = -8.729334e+32
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00111001110001110100110100100011;
		b = 32'b01110000000110010011001000100011;
		correct = 32'b01110000000110010011001000100011;
		#400 //0.0003801371 * 1.8964727e+29 = 1.8964727e+29
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11001010011101010100100010101010;
		b = 32'b00111111111000100001110010001010;
		correct = 32'b11001010011101010100100010100011;
		#400 //-4018730.5 * 1.766496 = -4018728.8
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01011101110111001010001100110110;
		b = 32'b00000001000110011011000101111001;
		correct = 32'b01011101110111001010001100110110;
		#400 //1.9873263e+18 * 2.8228992e-38 = 1.9873263e+18
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11100101100110101000111001101111;
		b = 32'b00111000101000111011100111110000;
		correct = 32'b11100101100110101000111001101111;
		#400 //-9.123398e+22 * 7.807079e-05 = -9.123398e+22
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01011101000011000110010010110010;
		b = 32'b00111011111011101101000010011000;
		correct = 32'b01011101000011000110010010110010;
		#400 //6.322754e+17 * 0.00728805 = 6.322754e+17
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10010100001000010011111001000111;
		b = 32'b10110101100110101001111001000100;
		correct = 32'b10110101100110101001111001000100;
		#400 //-8.140705e-27 * -1.1519955e-06 = -1.1519955e-06
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11011100001101111011000011010111;
		b = 32'b00100101010010110110000101110010;
		correct = 32'b11011100001101111011000011010111;
		#400 //-2.0681743e+17 * 1.7640459e-16 = -2.0681743e+17
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01111011101110011011111100110100;
		b = 32'b00010111001000100011110010011001;
		correct = 32'b01111011101110011011111100110100;
		#400 //1.928906e+36 * 5.242151e-25 = 1.928906e+36
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00011110011000001101001010110001;
		b = 32'b00110001010100000110110110000101;
		correct = 32'b00110001010100000110110110000101;
		#400 //1.1902031e-20 * 3.0330238e-09 = 3.0330238e-09
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00100011001101101011110110110110;
		b = 32'b00110111101011100100000011010011;
		correct = 32'b00110111101011100100000011010011;
		#400 //9.906413e-18 * 2.0772603e-05 = 2.0772603e-05
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10000111101110100100010011010110;
		b = 32'b11000101010000110001101011010001;
		correct = 32'b11000101010000110001101011010001;
		#400 //-2.8026628e-34 * -3121.676 = -3121.676
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01011000000111110101111010001111;
		b = 32'b11100000111101001010010100010110;
		correct = 32'b11100000111101001010010011000110;
		#400 //700913900000000.0 * -1.4102816e+20 = -1.4102746e+20
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00110101001111010110101111101000;
		b = 32'b10001110101001001111110111110011;
		correct = 32'b00110101001111010110101111101000;
		#400 //7.056501e-07 * -4.0673666e-30 = 7.056501e-07
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11001011011111000001000000011001;
		b = 32'b10001110010100110101101111110100;
		correct = 32'b11001011011111000001000000011001;
		#400 //-16519193.0 * -2.6052032e-30 = -16519193.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00001010111110001000011011010101;
		b = 32'b01110111000111111100000100101111;
		correct = 32'b01110111000111111100000100101111;
		#400 //2.393225e-32 * 3.2402087e+33 = 3.2402087e+33
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10010011001001011100011011010010;
		b = 32'b10101001101110111101000011011100;
		correct = 32'b10101001101110111101000011011100;
		#400 //-2.0923954e-27 * -8.3406996e-14 = -8.3406996e-14
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01110010011000110011000010010101;
		b = 32'b10001011100010000111010000010000;
		correct = 32'b01110010011000110011000010010101;
		#400 //4.499957e+30 * -5.2559926e-32 = 4.499957e+30
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11000010110100111010010001010101;
		b = 32'b10111100111101101110100111000101;
		correct = 32'b11000010110100111011001111000100;
		#400 //-105.82096 * -0.030140767 = -105.851105
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11100001110111010001000011110101;
		b = 32'b10011001010111001010000101000000;
		correct = 32'b11100001110111010001000011110101;
		#400 //-5.0974404e+20 * -1.14062976e-23 = -5.0974404e+20
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11011111110000110111011000001001;
		b = 32'b01111001101010011101001100100010;
		correct = 32'b01111001101010011101001100100010;
		#400 //-2.816891e+19 * 1.1022256e+35 = 1.1022256e+35
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10110000010100111100101111100110;
		b = 32'b10001111101000111010101111011100;
		correct = 32'b10110000010100111100101111100110;
		#400 //-7.705111e-10 * -1.6139239e-29 = -7.705111e-10
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10111010100101011011011101100011;
		b = 32'b10111100011001110111010100001110;
		correct = 32'b10111100011110100010101111111010;
		#400 //-0.0011422451 * -0.014127029 = -0.015269274
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01100100011111111100101010010110;
		b = 32'b00010010111000000001100100001110;
		correct = 32'b01100100011111111100101010010110;
		#400 //1.887407e+22 * 1.4142564e-27 = 1.887407e+22
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11101100011011100001111110100011;
		b = 32'b11100001011110110110010010001001;
		correct = 32'b11101100011011100001111110100111;
		#400 //-1.151495e+27 * -2.8983607e+20 = -1.1514953e+27
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10111001000101110011111000111111;
		b = 32'b10111100011000101010001100100100;
		correct = 32'b10111100011001010000000000011101;
		#400 //-0.0001442367 * -0.013832841 = -0.013977078
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11101111110011111011000110110000;
		b = 32'b00010111111010100100000010100110;
		correct = 32'b11101111110011111011000110110000;
		#400 //-1.2855642e+29 * 1.5138215e-24 = -1.2855642e+29
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10101000100101100011010000000010;
		b = 32'b01011011111101010010001110000111;
		correct = 32'b01011011111101010010001110000111;
		#400 //-1.66759e-14 * 1.3800086e+17 = 1.3800086e+17
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11110110001100010011101000111010;
		b = 32'b10010111101110001101111100000001;
		correct = 32'b11110110001100010011101000111010;
		#400 //-8.986499e+32 * -1.1947015e-24 = -8.986499e+32
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00101110000101010101111000000011;
		b = 32'b11011111010110110100111111011101;
		correct = 32'b11011111010110110100111111011101;
		#400 //3.3962177e-11 * -1.5803093e+19 = -1.5803093e+19
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00010111111100110011001011000101;
		b = 32'b01010011000000010000100011101100;
		correct = 32'b01010011000000010000100011101100;
		#400 //1.5716323e-24 * 554200470000.0 = 554200470000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10100001000010110001111010101011;
		b = 32'b10101110010010000001111000101101;
		correct = 32'b10101110010010000001111000101101;
		#400 //-4.713562e-19 * -4.5501537e-11 = -4.5501537e-11
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01011011101001001010001100110101;
		b = 32'b11010011111110100111101101100111;
		correct = 32'b01011011101001001010001000111011;
		#400 //9.268269e+16 * -2151624300000.0 = 9.268054e+16
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01010011110000101100111010111001;
		b = 32'b01000100111101101000101010000101;
		correct = 32'b01010011110000101100111010111001;
		#400 //1673383800000.0 * 1972.3287 = 1673383800000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00000101111001110110101010100100;
		b = 32'b01101011111001000101100111101111;
		correct = 32'b01101011111001000101100111101111;
		#400 //2.1762309e-35 * 5.5211957e+26 = 5.5211957e+26
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11010100010100110000100111101001;
		b = 32'b00011110110000101010010111110110;
		correct = 32'b11010100010100110000100111101001;
		#400 //-3625617500000.0 * 2.0609189e-20 = -3625617500000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10000001011000010110110000010011;
		b = 32'b01011011110000110010010100010110;
		correct = 32'b01011011110000110010010100010110;
		#400 //-4.1403513e-38 * 1.0985679e+17 = 1.0985679e+17
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00010110010111011101010110010001;
		b = 32'b10000101110111101001010000011101;
		correct = 32'b00010110010111011101010110010001;
		#400 //1.7919628e-25 * -2.0931188e-35 = 1.7919628e-25
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11011001001100010101001110010010;
		b = 32'b00011111111000001001110001111001;
		correct = 32'b11011001001100010101001110010010;
		#400 //-3119559800000000.0 * 9.512655e-20 = -3119559800000000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01111010001001000110101100110100;
		b = 32'b00010011001001110110100011111001;
		correct = 32'b01111010001001000110101100110100;
		#400 //2.1342776e+35 * 2.1130119e-27 = 2.1342776e+35
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00101101100100001011011110000100;
		b = 32'b00100000110111001011000101111001;
		correct = 32'b00101101100100001011011110000100;
		#400 //1.6452402e-11 * 3.738689e-19 = 1.6452402e-11
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01111001100100110110001001010111;
		b = 32'b10000010101011101011001111000110;
		correct = 32'b01111001100100110110001001010111;
		#400 //9.565778e+34 * -2.5670187e-37 = 9.565778e+34
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11111000000001101010100001000001;
		b = 32'b11111101000011001000111111001010;
		correct = 32'b11111101000011001011000101110100;
		#400 //-1.0924693e+34 * -1.1677407e+37 = -1.1688332e+37
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00010010101011111100101001010111;
		b = 32'b00011110000100110101000010110100;
		correct = 32'b00011110000100110101000010110101;
		#400 //1.1093933e-27 * 7.798804e-21 = 7.798805e-21
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00111110101100001000100101111000;
		b = 32'b11111010001001111100111010100110;
		correct = 32'b11111010001001111100111010100110;
		#400 //0.3447988 * -2.1782623e+35 = -2.1782623e+35
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01001001111001000101011010000100;
		b = 32'b10111110010111100110111010011001;
		correct = 32'b01001001111001000101011010000010;
		#400 //1870544.5 * -0.21721877 = 1870544.2
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11100100000100110011000001110111;
		b = 32'b11011101010111011110101011110000;
		correct = 32'b11100100000100110011001111101111;
		#400 //-1.0860655e+22 * -9.994286e+17 = -1.0861654e+22
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10000101001010110000100101010000;
		b = 32'b11011010000111011011000111001011;
		correct = 32'b11011010000111011011000111001011;
		#400 //-8.042092e-36 * -1.1096764e+16 = -1.1096764e+16
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00000001010100011111100000110111;
		b = 32'b01100111010000010001000000001110;
		correct = 32'b01100111010000010001000000001110;
		#400 //3.8565323e-38 * 9.117129e+23 = 9.117129e+23
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10011010000000000100110101001001;
		b = 32'b11010110001011100110001011111001;
		correct = 32'b11010110001011100110001011111001;
		#400 //-2.653221e-23 * -47935027000000.0 = -47935027000000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01011001011011010100010000110101;
		b = 32'b01101110011011101100111111100010;
		correct = 32'b01101110011011101100111111100010;
		#400 //4174035200000000.0 * 1.8477187e+28 = 1.8477187e+28
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10110101110101101010100111011011;
		b = 32'b11111000110001101010011010011011;
		correct = 32'b11111000110001101010011010011011;
		#400 //-1.5993677e-06 * -3.2232936e+34 = -3.2232936e+34
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00110000011011100000100000000011;
		b = 32'b11001000000000010010011010110010;
		correct = 32'b11001000000000010010011010110010;
		#400 //8.659528e-10 * -132250.78 = -132250.78
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00001011110110110011011110001001;
		b = 32'b00010010100110001000100111001100;
		correct = 32'b00010010100110001000110100111001;
		#400 //8.443929e-32 * 9.626518e-28 = 9.627363e-28
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01010111101001001101000110111110;
		b = 32'b11001011111001011011001001111100;
		correct = 32'b01010111101001001101000110111101;
		#400 //362441500000000.0 * -30106872.0 = 362441450000000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01001101000000001110110101001001;
		b = 32'b00101010010010111101111001001011;
		correct = 32'b01001101000000001110110101001001;
		#400 //135189650.0 * 1.8107145e-13 = 135189650.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01101100010011101000001000011011;
		b = 32'b00001001000001101110111011110011;
		correct = 32'b01101100010011101000001000011011;
		#400 //9.986125e+26 * 1.6242017e-33 = 9.986125e+26
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11001000011000100010001110110100;
		b = 32'b10100011101000010110010010101101;
		correct = 32'b11001000011000100010001110110100;
		#400 //-231566.81 * -1.7498293e-17 = -231566.81
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00101110001011001111100110001110;
		b = 32'b01111010101110110011001001111010;
		correct = 32'b01111010101110110011001001111010;
		#400 //3.932992e-11 * 4.8599165e+35 = 4.8599165e+35
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10101101000010111111010101011000;
		b = 32'b00010010111100100000011111011010;
		correct = 32'b10101101000010111111010101011000;
		#400 //-7.9557125e-12 * 1.5274283e-27 = -7.9557125e-12
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01000001101010110001100111111111;
		b = 32'b01011111111101101111100100101100;
		correct = 32'b01011111111101101111100100101100;
		#400 //21.387693 * 3.5592608e+19 = 3.5592608e+19
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10000111100000000100001101011111;
		b = 32'b10000111100001001000011111111111;
		correct = 32'b10001000000000100110010110101111;
		#400 //-1.9298897e-34 * -1.9941084e-34 = -3.923998e-34
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11001100001100110110011000001101;
		b = 32'b01000001000110110100000000100001;
		correct = 32'b11001100001100110110011000001011;
		#400 //-47028276.0 * 9.703156 = -47028268.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00100111011111100011001100100100;
		b = 32'b01110100010110001011010110000011;
		correct = 32'b01110100010110001011010110000011;
		#400 //3.5277304e-15 * 6.8677833e+31 = 6.8677833e+31
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10111001011101010110110100000010;
		b = 32'b10101000001001100011011010101100;
		correct = 32'b10111001011101010110110100000010;
		#400 //-0.0002340563 * -9.226706e-15 = -0.0002340563
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10011011100101000101110100000001;
		b = 32'b11110111010110101010011010101100;
		correct = 32'b11110111010110101010011010101100;
		#400 //-2.4544648e-22 * -4.4347704e+33 = -4.4347704e+33
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01100010001101100011100000111100;
		b = 32'b00000101010001100000101001101001;
		correct = 32'b01100010001101100011100000111100;
		#400 //8.403399e+20 * 9.311827e-36 = 8.403399e+20
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11100011001001010011001111011110;
		b = 32'b01010100011110011010011110011101;
		correct = 32'b11100011001001010011001111011110;
		#400 //-3.0474502e+21 * 4289035800000.0 = -3.0474502e+21
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11010101001110110011110101011100;
		b = 32'b00011100010110001010100010101101;
		correct = 32'b11010101001110110011110101011100;
		#400 //-12867013000000.0 * 7.1686413e-22 = -12867013000000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10100001010001001010111100011001;
		b = 32'b01100110101110011000101000001101;
		correct = 32'b01100110101110011000101000001101;
		#400 //-6.6639123e-19 * 4.380922e+23 = 4.380922e+23
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01111001101101011110101011001000;
		b = 32'b10111011010100111010010101001011;
		correct = 32'b01111001101101011110101011001000;
		#400 //1.1807096e+35 * -0.0032294567 = 1.1807096e+35
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00100001110111111011000110111110;
		b = 32'b10011011111101100010111011101000;
		correct = 32'b00100001110111111010001001011011;
		#400 //1.5158116e-18 * -4.0727599e-22 = 1.5154043e-18
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01100011000011010101000101100111;
		b = 32'b01010000001111100011101100100100;
		correct = 32'b01100011000011010101000101100111;
		#400 //2.6068566e+21 * 12766188000.0 = 2.6068566e+21
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11101111001011101101100010010110;
		b = 32'b00101110100111000011110001011110;
		correct = 32'b11101111001011101101100010010110;
		#400 //-5.411223e+28 * 7.104782e-11 = -5.411223e+28
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10010001011111001001111111101111;
		b = 32'b11010011110111100001001110000110;
		correct = 32'b11010011110111100001001110000110;
		#400 //-1.9928578e-28 * -1907620600000.0 = -1907620600000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11110000001111100110101100011000;
		b = 32'b01100101100011101101100100110110;
		correct = 32'b11110000001111100110101100010100;
		#400 //-2.3572648e+29 * 8.432286e+22 = -2.357264e+29
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10010000011111010010101111110000;
		b = 32'b00111000001101010100111110000011;
		correct = 32'b00111000001101010100111110000011;
		#400 //-4.99293e-29 * 4.3227814e-05 = 4.3227814e-05
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01110001011111011011011110000011;
		b = 32'b11100001001001001001100001010101;
		correct = 32'b01110001011111011011011110000011;
		#400 //1.25634495e+30 * -1.8976517e+20 = 1.25634495e+30
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11101001101000001101001011011110;
		b = 32'b10000011110110111010000010100010;
		correct = 32'b11101001101000001101001011011110;
		#400 //-2.430299e+25 * -1.2908543e-36 = -2.430299e+25
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11110001101000001011010001111101;
		b = 32'b11000010000110011100100001010011;
		correct = 32'b11110001101000001011010001111101;
		#400 //-1.5915456e+30 * -38.44563 = -1.5915456e+30
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11101011111001010001101100111100;
		b = 32'b11010100000100010010010101001100;
		correct = 32'b11101011111001010001101100111100;
		#400 //-5.5394525e+26 * -2493584000000.0 = -5.5394525e+26
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11001000100100001010001100110001;
		b = 32'b00000011111001101000101000010110;
		correct = 32'b11001000100100001010001100110001;
		#400 //-296217.53 * 1.3549888e-36 = -296217.53
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01011101001101110001011100101101;
		b = 32'b10101011001000101110111001111111;
		correct = 32'b01011101001101110001011100101101;
		#400 //8.2456644e+17 * -5.788494e-13 = 8.2456644e+17
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01100011010101010000100001000010;
		b = 32'b00101011110100110011011110010000;
		correct = 32'b01100011010101010000100001000010;
		#400 //3.9297515e+21 * 1.5007873e-12 = 3.9297515e+21
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11110011101100001100111000001100;
		b = 32'b10100011000001101011001001001101;
		correct = 32'b11110011101100001100111000001100;
		#400 //-2.801585e+31 * -7.301911e-18 = -2.801585e+31
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01100001101000110101000101011000;
		b = 32'b10010101110111011111110010111111;
		correct = 32'b01100001101000110101000101011000;
		#400 //3.765851e+20 * -8.965995e-26 = 3.765851e+20
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10001010100010110101110111100101;
		b = 32'b10101110010001110011101110001110;
		correct = 32'b10101110010001110011101110001110;
		#400 //-1.3420532e-32 * -4.5300257e-11 = -4.5300257e-11
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11101011011001101110011010101100;
		b = 32'b11100000011111000001111101110010;
		correct = 32'b11101011011001101110011010110000;
		#400 //-2.7914226e+26 * -7.266946e+19 = -2.7914233e+26
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10000110001111110100011111101100;
		b = 32'b00110111110001110101010100001011;
		correct = 32'b00110111110001110101010100001011;
		#400 //-3.5975947e-35 * 2.376225e-05 = 2.376225e-05
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00110000100010001011001110000111;
		b = 32'b11100001000000100010101110101000;
		correct = 32'b11100001000000100010101110101000;
		#400 //9.946327e-10 * -1.500764e+20 = -1.500764e+20
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01010111010100111011111000101100;
		b = 32'b01011111001100010001110110111101;
		correct = 32'b01011111001100010001111010010001;
		#400 //232813740000000.0 * 1.2762565e+19 = 1.2762798e+19
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00100100110001101011100101110101;
		b = 32'b10011010100001101000100101101110;
		correct = 32'b00100100110001101011100101101101;
		#400 //8.618299e-17 * -5.564313e-23 = 8.6182936e-17
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01100100011011100001010110000111;
		b = 32'b10001001101010000010100010001100;
		correct = 32'b01100100011011100001010110000111;
		#400 //1.7567505e+22 * -4.048266e-33 = 1.7567505e+22
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11111010001111010000100111110010;
		b = 32'b00111110000001010000111100101101;
		correct = 32'b11111010001111010000100111110010;
		#400 //-2.4538646e+35 * 0.1299407 = -2.4538646e+35
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11111001010110001000110011011110;
		b = 32'b11111011101000100101100011000110;
		correct = 32'b11111011101010010001110100101101;
		#400 //-7.027458e+34 * -1.6859053e+36 = -1.7561798e+36
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11011110000001111111001011110011;
		b = 32'b00001101101110011000011100010100;
		correct = 32'b11011110000001111111001011110011;
		#400 //-2.4490398e+18 * 1.1434024e-30 = -2.4490398e+18
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00100000000011100000011000111001;
		b = 32'b01111101110100010101101011011000;
		correct = 32'b01111101110100010101101011011000;
		#400 //1.2029927e-19 * 3.4785042e+37 = 3.4785042e+37
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00111011001000010111110011110011;
		b = 32'b01111000010100110100101001100101;
		correct = 32'b01111000010100110100101001100101;
		#400 //0.0024641126 * 1.714193e+34 = 1.714193e+34
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10101111000010100001001001111010;
		b = 32'b10111011000100111000100000101110;
		correct = 32'b10111011000100111000100000101111;
		#400 //-1.2557591e-10 * -0.002251159 = -0.0022511592
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10110111110111100010110001111001;
		b = 32'b10010101110101100110100011110100;
		correct = 32'b10110111110111100010110001111001;
		#400 //-2.6485171e-05 * -8.65995e-26 = -2.6485171e-05
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11110100000000001110011010100110;
		b = 32'b11010100010010101010101110101011;
		correct = 32'b11110100000000001110011010100110;
		#400 //-4.085035e+31 * -3481854000000.0 = -4.085035e+31
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10110010101011000001101001101010;
		b = 32'b00000111101000101111011110110010;
		correct = 32'b10110010101011000001101001101010;
		#400 //-2.0035447e-08 * 2.4520633e-34 = -2.0035447e-08
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10000100001100100010110100010111;
		b = 32'b00001101000010111010000101010101;
		correct = 32'b00001101000010111010000100101000;
		#400 //-2.0944504e-36 * 4.302688e-31 = 4.3026667e-31
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11000101101000100110110110000010;
		b = 32'b11010101110011000000110110010000;
		correct = 32'b11010101110011000000110110010000;
		#400 //-5197.6885 * -28044828000000.0 = -28044828000000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10011001010010001110101011101100;
		b = 32'b01011011011101010000000110100010;
		correct = 32'b01011011011101010000000110100010;
		#400 //-1.03872e-23 * 6.8963165e+16 = 6.8963165e+16
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01000111110101001011110000001110;
		b = 32'b10010100110110011101110011110110;
		correct = 32'b01000111110101001011110000001110;
		#400 //108920.11 * -2.1998554e-26 = 108920.11
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01101001111111101110101100100101;
		b = 32'b00110010110101001111100010011010;
		correct = 32'b01101001111111101110101100100101;
		#400 //3.85222e+25 * 2.47931e-08 = 3.85222e+25
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01100100000101000100111001100101;
		b = 32'b10000100011111011000101011101100;
		correct = 32'b01100100000101000100111001100101;
		#400 //1.0943068e+22 * -2.9803797e-36 = 1.0943068e+22
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01001101101000011101100111111101;
		b = 32'b10000001010001010000010000011110;
		correct = 32'b01001101101000011101100111111101;
		#400 //339427230.0 * -3.618614e-38 = 339427230.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01101100000100011011001101101100;
		b = 32'b11001110101111001100011011011100;
		correct = 32'b01101100000100011011001101101100;
		#400 //7.0456616e+26 * -1583574500.0 = 7.0456616e+26
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00000000011111100000100001101111;
		b = 32'b01110010001011101011001101010101;
		correct = 32'b01110010001011101011001101010101;
		#400 //1.1574298e-38 * 3.4603002e+30 = 3.4603002e+30
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10010010011100111101000110100000;
		b = 32'b10101010111010101011111000000101;
		correct = 32'b10101010111010101011111000000101;
		#400 //-7.6935663e-28 * -4.1698603e-13 = -4.1698603e-13
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00000110001101011011001101100011;
		b = 32'b00110010100011010101010101111110;
		correct = 32'b00110010100011010101010101111110;
		#400 //3.417411e-35 * 1.6453438e-08 = 1.6453438e-08
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01100000111100101100111001001100;
		b = 32'b00101000111001000111010001100111;
		correct = 32'b01100000111100101100111001001100;
		#400 //1.3996804e+20 * 2.5363566e-14 = 1.3996804e+20
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01100011000110111101011000100110;
		b = 32'b01010100100000110100000111011100;
		correct = 32'b01100011000110111101011000100110;
		#400 //2.8746764e+21 * 4509965000000.0 = 2.8746764e+21
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11110001110010111010001011111100;
		b = 32'b01101001101001010001001111001100;
		correct = 32'b11110001110010111010001001010111;
		#400 //-2.0167198e+30 * 2.494578e+25 = -2.0166948e+30
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11001011110101010010010010111001;
		b = 32'b11111111010100110110100100010110;
		correct = 32'b11111111010100110110100100010110;
		#400 //-27937138.0 * -2.8101274e+38 = -2.8101274e+38
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10010011110001010001100000010110;
		b = 32'b01100101011001111111101101000011;
		correct = 32'b01100101011001111111101101000011;
		#400 //-4.9753542e-27 * 6.846885e+22 = 6.846885e+22
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01100010101100010101100110111010;
		b = 32'b00001101100100110010011110100101;
		correct = 32'b01100010101100010101100110111010;
		#400 //1.6357696e+21 * 9.069119e-31 = 1.6357696e+21
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11001001001100011100000100101111;
		b = 32'b00110111010110110100100010101000;
		correct = 32'b11001001001100011100000100101111;
		#400 //-728082.94 * 1.3070334e-05 = -728082.94
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00100110011000100110110100000101;
		b = 32'b01100000110110100100100101101100;
		correct = 32'b01100000110110100100100101101100;
		#400 //7.855725e-16 * 1.25833775e+20 = 1.25833775e+20
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11110110101001101100111111000101;
		b = 32'b00111111000000011011000010011011;
		correct = 32'b11110110101001101100111111000101;
		#400 //-1.6916706e+33 * 0.50660104 = -1.6916706e+33
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10101111111110010101110101001000;
		b = 32'b00010111101010111001011001100001;
		correct = 32'b10101111111110010101110101001000;
		#400 //-4.5359116e-10 * 1.1088577e-24 = -4.5359116e-10
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10101110010010100111001111100000;
		b = 32'b10100100110000111111100000001110;
		correct = 32'b10101110010010100111001111111000;
		#400 //-4.60324e-11 * -8.498799e-17 = -4.6032483e-11
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11100011111000001110000100011000;
		b = 32'b11001111100000100111000000001010;
		correct = 32'b11100011111000001110000100011000;
		#400 //-8.296581e+21 * -4376761300.0 = -8.296581e+21
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01100111010010100100000001111110;
		b = 32'b10100011100000101010100001110101;
		correct = 32'b01100111010010100100000001111110;
		#400 //9.551077e+23 * -1.4165973e-17 = 9.551077e+23
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10110111010011101101111111111011;
		b = 32'b00111111000001110110110100010010;
		correct = 32'b00111111000001110110110001000011;
		#400 //-1.2330706e-05 * 0.52900803 = 0.5289957
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10000010110111000010101100000000;
		b = 32'b10100111110111101011110010110000;
		correct = 32'b10100111110111101011110010110000;
		#400 //-3.2350775e-37 * -6.1821953e-15 = -6.1821953e-15
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11010010010011011110100011000000;
		b = 32'b10001111011011011011000011011000;
		correct = 32'b11010010010011011110100011000000;
		#400 //-221093300000.0 * -1.1719061e-29 = -221093300000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00101010111000011001011110010111;
		b = 32'b10111101111011101110101000101100;
		correct = 32'b10111101111011101110101000101100;
		#400 //4.0073215e-13 * -0.116657585 = -0.116657585
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01011011001000010100010000010110;
		b = 32'b01111000110111010100100110011011;
		correct = 32'b01111000110111010100100110011011;
		#400 //4.5392333e+16 * 3.5905953e+34 = 3.5905953e+34
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11101010101111011100001011110110;
		b = 32'b10110001101001101101101011111111;
		correct = 32'b11101010101111011100001011110110;
		#400 //-1.1470383e+26 * -4.856133e-09 = -1.1470383e+26
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10000101010110001000101100110001;
		b = 32'b00000100100010111011111110011100;
		correct = 32'b10000101000100101010101101100011;
		#400 //-1.01818366e-35 * 3.285471e-36 = -6.896366e-36
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11111000110111011111011100010100;
		b = 32'b10011000111101101001110000100010;
		correct = 32'b11111000110111011111011100010100;
		#400 //-3.6015905e+34 * -6.3747163e-24 = -3.6015905e+34
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10000100011101101110100011011000;
		b = 32'b11000110101010010000110100011000;
		correct = 32'b11000110101010010000110100011000;
		#400 //-2.9024078e-36 * -21638.547 = -21638.547
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01000110001110001011110000111111;
		b = 32'b00110011110111111010101100111011;
		correct = 32'b01000110001110001011110000111111;
		#400 //11823.062 * 1.0415393e-07 = 11823.062
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01100001110010011010101000111110;
		b = 32'b00111000100010000110100100100001;
		correct = 32'b01100001110010011010101000111110;
		#400 //4.6500785e+20 * 6.504567e-05 = 4.6500785e+20
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10101101001100101100000100100101;
		b = 32'b00011101001011110000111110000111;
		correct = 32'b10101101001100101100000100100101;
		#400 //-1.0161015e-11 * 2.3169085e-21 = -1.0161015e-11
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11111011110100110111111111110010;
		b = 32'b00000001101101111011010110000010;
		correct = 32'b11111011110100110111111111110010;
		#400 //-2.1963394e+36 * 6.7484034e-38 = -2.1963394e+36
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01000001001000000100100011110110;
		b = 32'b11101101010111011011001111010111;
		correct = 32'b11101101010111011011001111010111;
		#400 //10.017813 * -4.28835e+27 = -4.28835e+27
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01101111001001010101001010101000;
		b = 32'b00011011110110110011101110110110;
		correct = 32'b01101111001001010101001010101000;
		#400 //5.116495e+28 * 3.6269098e-22 = 5.116495e+28
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00010101100011110010110010111100;
		b = 32'b11010101000000110011110010111100;
		correct = 32'b11010101000000110011110010111100;
		#400 //5.782782e-26 * -9018555000000.0 = -9018555000000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01011111011110100111110001010011;
		b = 32'b01010011011000010101001100101011;
		correct = 32'b01011111011110100111110001010100;
		#400 //1.8049393e+19 * 967763000000.0 = 1.8049394e+19
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11101110111001111100010101010101;
		b = 32'b01010111110111000010110000100110;
		correct = 32'b11101110111001111100010101010101;
		#400 //-3.5864799e+28 * 484164350000000.0 = -3.5864799e+28
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00101100101111111000110010010110;
		b = 32'b10101010110101110000110000101011;
		correct = 32'b00101100101100100001101111010011;
		#400 //5.4441547e-12 * -3.8200115e-13 = 5.0621534e-12
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00100001001110000001010100011000;
		b = 32'b00111111000110101110000110010000;
		correct = 32'b00111111000110101110000110010000;
		#400 //6.236954e-19 * 0.6050043 = 0.6050043
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10001011110001111111000011101010;
		b = 32'b01010011110100101000010111101110;
		correct = 32'b01010011110100101000010111101110;
		#400 //-7.70145e-32 * 1808380200000.0 = 1808380200000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11001101011001101101101011100000;
		b = 32'b00101011111100101000101011101010;
		correct = 32'b11001101011001101101101011100000;
		#400 //-242069000.0 * 1.7233691e-12 = -242069000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01010001111110011010111101011110;
		b = 32'b11011010000101010001001100000010;
		correct = 32'b11011010000101010001001010000101;
		#400 //134048630000.0 * -1.0490168e+16 = -1.0490033e+16
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11011101011000100100100110000101;
		b = 32'b10111000010101110000101100011011;
		correct = 32'b11011101011000100100100110000101;
		#400 //-1.0191069e+18 * -5.1270337e-05 = -1.0191069e+18
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00011011010100010010110100101100;
		b = 32'b01010001101000101011111101011110;
		correct = 32'b01010001101000101011111101011110;
		#400 //1.730267e-22 * 87374410000.0 = 87374410000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01100101101101110111000100001101;
		b = 32'b01010010001001000110011010111011;
		correct = 32'b01100101101101110111000100001101;
		#400 //1.0828481e+23 * 176524540000.0 = 1.0828481e+23
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11011101011100111011010101011100;
		b = 32'b10001110001111001101100000011001;
		correct = 32'b11011101011100111011010101011100;
		#400 //-1.0975652e+18 * -2.3276836e-30 = -1.0975652e+18
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11001100010000000110001111001010;
		b = 32'b11100000100001111000010010011001;
		correct = 32'b11100000100001111000010010011001;
		#400 //-50433830.0 * -7.8120785e+19 = -7.8120785e+19
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00110001111011010000000101001000;
		b = 32'b10000010100010110001000011110100;
		correct = 32'b00110001111011010000000101001000;
		#400 //6.8977535e-09 * -2.0433945e-37 = 6.8977535e-09
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11010010110010011010010110000010;
		b = 32'b11000110100110010100011010100011;
		correct = 32'b11010010110010011010010110000011;
		#400 //-433032600000.0 * -19619.318 = -433032630000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01010011101001010100010100111100;
		b = 32'b00110010110110101100100010101000;
		correct = 32'b01010011101001010100010100111100;
		#400 //1419662300000.0 * 2.5469788e-08 = 1419662300000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00011011011011011110011010110011;
		b = 32'b00010111111001110111001011110011;
		correct = 32'b00011011011011111011010110011001;
		#400 //1.9678723e-22 * 1.4957042e-24 = 1.9828294e-22
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11010000101111110000010000100001;
		b = 32'b10011000100100001111001110001110;
		correct = 32'b11010000101111110000010000100001;
		#400 //-25637750000.0 * -3.7469055e-24 = -25637750000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10011101001000101100110101110011;
		b = 32'b10101000001111000010101111110110;
		correct = 32'b10101000001111000010101111111001;
		#400 //-2.1546736e-21 * -1.0445629e-14 = -1.04456315e-14
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10101010110010000001111101110101;
		b = 32'b00111000010101101011110101001011;
		correct = 32'b00111000010101101011110101001011;
		#400 //-3.5548964e-13 * 5.119787e-05 = 5.119787e-05
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11100011101100111000011101001111;
		b = 32'b01100111101000010001100101011111;
		correct = 32'b01100111101000000110010111011000;
		#400 //-6.6234344e+21 * 1.521538e+24 = 1.5149146e+24
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00011110000001110100111100101010;
		b = 32'b01100111110110000110101010001110;
		correct = 32'b01100111110110000110101010001110;
		#400 //7.163211e-21 * 2.0439935e+24 = 2.0439935e+24
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01110110001000011011010111011000;
		b = 32'b01111101110100100000011100110001;
		correct = 32'b01111101110100100000100001110100;
		#400 //8.199688e+32 * 3.4896902e+37 = 3.4897721e+37
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10101110011000110011110100100010;
		b = 32'b11010001111011010110100000011011;
		correct = 32'b11010001111011010110100000011011;
		#400 //-5.166812e-11 * -127456730000.0 = -127456730000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01101110011010000101001000010010;
		b = 32'b00111100110010111000011000110001;
		correct = 32'b01101110011010000101001000010010;
		#400 //1.7974935e+28 * 0.02484426 = 1.7974935e+28
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01111101101000111111000110000111;
		b = 32'b00111010111101000100100101011111;
		correct = 32'b01111101101000111111000110000111;
		#400 //2.723978e+37 * 0.0018637589 = 2.723978e+37
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10110101111100010101101110100111;
		b = 32'b00011100111100110010110000111100;
		correct = 32'b10110101111100010101101110100111;
		#400 //-1.7982574e-06 * 1.6091825e-21 = -1.7982574e-06
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00010110100011000000000000001000;
		b = 32'b01100101010010111101000010110000;
		correct = 32'b01100101010010111101000010110000;
		#400 //2.261824e-25 * 6.0155625e+22 = 6.0155625e+22
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11000000000100001000010101001000;
		b = 32'b11011001111010101111100110111111;
		correct = 32'b11011001111010101111100110111111;
		#400 //-2.2581348 * -8267468000000000.0 = -8267468000000000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11000111100100100100110010100101;
		b = 32'b11111111011101001010110110111011;
		correct = 32'b11111111011101001010110110111011;
		#400 //-74905.29 * -3.252337e+38 = -3.252337e+38
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01001110001110111101000101110011;
		b = 32'b00111111001001001001111001001111;
		correct = 32'b01001110001110111101000101110011;
		#400 //787766460.0 * 0.6430406 = 787766460.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00011000110001011110111001011110;
		b = 32'b01000000001101001010001001001101;
		correct = 32'b01000000001101001010001001001101;
		#400 //5.1163996e-24 * 2.822406 = 2.822406
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00001001000101011111111001110111;
		b = 32'b11111101100001010101011111001010;
		correct = 32'b11111101100001010101011111001010;
		#400 //1.8054871e-33 * -2.2155394e+37 = -2.2155394e+37
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00111011111110111000110001100010;
		b = 32'b10000010100111000001111001110110;
		correct = 32'b00111011111110111000110001100010;
		#400 //0.007676647 * -2.2939624e-37 = 0.007676647
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00010011111110100100111000110011;
		b = 32'b11111000111010001011001101111001;
		correct = 32'b11111000111010001011001101111001;
		#400 //6.3185983e-27 * -3.7757907e+34 = -3.7757907e+34
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01101011001001110011111100010000;
		b = 32'b10100000101011101010000101100101;
		correct = 32'b01101011001001110011111100010000;
		#400 //2.0218842e+26 * -2.9583549e-19 = 2.0218842e+26
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11110010111001011001110111000111;
		b = 32'b01010111110111010101110011001101;
		correct = 32'b11110010111001011001110111000111;
		#400 //-9.0960395e+30 * 486781300000000.0 = -9.0960395e+30
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11111000000011011010111010001011;
		b = 32'b11110111100001011100001111000101;
		correct = 32'b11111000010100001001000001101110;
		#400 //-1.1494594e+34 * -5.426142e+33 = -1.6920736e+34
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11110011101111011111110110111001;
		b = 32'b01110111000010000011100101100110;
		correct = 32'b01110111000001101011110101101011;
		#400 //-3.0105292e+31 * 2.7629553e+33 = 2.73285e+33
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00100101010010001100111100101110;
		b = 32'b11000100101111110011000111001011;
		correct = 32'b11000100101111110011000111001011;
		#400 //1.741743e-16 * -1529.556 = -1529.556
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01100111110001000100110011111010;
		b = 32'b11010001110101011111111011110101;
		correct = 32'b01100111110001000100110011111010;
		#400 //1.8540076e+24 * -114888190000.0 = 1.8540076e+24
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10000101111110101000001011111010;
		b = 32'b01000110110000100000011000110011;
		correct = 32'b01000110110000100000011000110011;
		#400 //-2.3558e-35 * 24835.1 = 24835.1
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11001111001111011101000101011010;
		b = 32'b00001110101000111010110111111001;
		correct = 32'b11001111001111011101000101011010;
		#400 //-3184614000.0 * 4.0350132e-30 = -3184614000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11011010111110011010100101000110;
		b = 32'b10001100001100000110110010101100;
		correct = 32'b11011010111110011010100101000110;
		#400 //-3.5136694e+16 * -1.3591249e-31 = -3.5136694e+16
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01000000001001001001011001000000;
		b = 32'b10110110010000111011111110010100;
		correct = 32'b01000000001001001001011000110100;
		#400 //2.5716705 * -2.9168777e-06 = 2.5716677
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01011000001111010010110001101010;
		b = 32'b11100011010100100000110010011110;
		correct = 32'b11100011010100100000110010011011;
		#400 //831993800000000.0 * -3.8747254e+21 = -3.8747246e+21
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00111011011100001101011111110000;
		b = 32'b11100110011001001010111100010110;
		correct = 32'b11100110011001001010111100010110;
		#400 //0.0036749803 * -2.6998233e+23 = -2.6998233e+23
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11011000010100010011101000110111;
		b = 32'b01000000101010011010101110001011;
		correct = 32'b11011000010100010011101000110111;
		#400 //-920191840000000.0 * 5.3021903 = -920191840000000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10111011100100001101011001000000;
		b = 32'b10000011000111001000110101010010;
		correct = 32'b10111011100100001101011001000000;
		#400 //-0.004420072 * -4.6006507e-37 = -0.004420072
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11000110111111101001100011011000;
		b = 32'b11011111111000001010001011100110;
		correct = 32'b11011111111000001010001011100110;
		#400 //-32588.422 * -3.2373506e+19 = -3.2373506e+19
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10000111100110000101110011011011;
		b = 32'b01001001011010011100100101010010;
		correct = 32'b01001001011010011100100101010010;
		#400 //-2.2924994e-34 * 957589.1 = 957589.1
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00100110100011101011101101100100;
		b = 32'b11111111010100010000101110100011;
		correct = 32'b11111111010100010000101110100011;
		#400 //9.904022e-16 * -2.7786907e+38 = -2.7786907e+38
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00001110001001011010010111001111;
		b = 32'b11000000010010100000110100011100;
		correct = 32'b11000000010010100000110100011100;
		#400 //2.0417654e-30 * -3.1570501 = -3.1570501
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01011111001000100101000010001011;
		b = 32'b11110000100010001001101101100001;
		correct = 32'b11110000100010001001101101100001;
		#400 //1.1696001e+19 * -3.3822242e+29 = -3.3822242e+29
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01111000100100010101010001010110;
		b = 32'b11000100110111110100001000001101;
		correct = 32'b01111000100100010101010001010110;
		#400 //2.358105e+34 * -1786.0641 = 2.358105e+34
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00000000110110010111100110110100;
		b = 32'b01001010011111101010111010010011;
		correct = 32'b01001010011111101010111010010011;
		#400 //1.9971962e-38 * 4172708.8 = 4172708.8
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01001110100110101110011011110100;
		b = 32'b00010011000101000000001010010000;
		correct = 32'b01001110100110101110011011110100;
		#400 //1299413500.0 * 1.868149e-27 = 1299413500.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00001110010100111011010100111100;
		b = 32'b10101110110111011101000111111111;
		correct = 32'b10101110110111011101000111111111;
		#400 //2.609502e-30 * -1.0087219e-10 = -1.0087219e-10
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11011010111101100110000011001011;
		b = 32'b01111111111111011011100110010101;
		correct = 32'b01111111111111011011100110010101;
		#400 //-3.4674635e+16 * nan = nan
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00000110001001010000110011001100;
		b = 32'b00110010101111111101011000010101;
		correct = 32'b00110010101111111101011000010101;
		#400 //3.1042453e-35 * 2.233268e-08 = 2.233268e-08
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00100100101110101101011100100100;
		b = 32'b11010101101111101101100011010010;
		correct = 32'b11010101101111101101100011010010;
		#400 //8.1029104e-17 * -26229806000000.0 = -26229806000000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11000011111101101001011100111001;
		b = 32'b10001001011011111011101100111101;
		correct = 32'b11000011111101101001011100111001;
		#400 //-493.18143 * -2.8856618e-33 = -493.18143
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01110010001110101101100101111100;
		b = 32'b00100011001011000010010011110010;
		correct = 32'b01110010001110101101100101111100;
		#400 //3.7009366e+30 * 9.331962e-18 = 3.7009366e+30
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00101000010011000100010111100110;
		b = 32'b01111000010000010101101011110100;
		correct = 32'b01111000010000010101101011110100;
		#400 //1.1339432e-14 * 1.5686844e+34 = 1.5686844e+34
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10000110101010011000000100001111;
		b = 32'b10001100100010101110111100011111;
		correct = 32'b10001100100010101111100110110111;
		#400 //-6.376037e-35 * -2.1406182e-31 = -2.1412558e-31
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01101110000010100010010110101010;
		b = 32'b00010101101110011110110110100010;
		correct = 32'b01101110000010100010010110101010;
		#400 //1.0688616e+28 * 7.5095823e-26 = 1.0688616e+28
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01001010011001001011111011000001;
		b = 32'b10001001111111000100010111000111;
		correct = 32'b01001010011001001011111011000001;
		#400 //3747760.2 * -6.073241e-33 = 3747760.2
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01000110101000100101110110101101;
		b = 32'b11100100001111010001111111110111;
		correct = 32'b11100100001111010001111111110111;
		#400 //20782.838 * -1.3954952e+22 = -1.3954952e+22
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00111101010101111111001010011101;
		b = 32'b00101011011000110100010111011011;
		correct = 32'b00111101010101111111001010011101;
		#400 //0.05272161 * 8.0743544e-13 = 0.05272161
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00100011010101100110111101001100;
		b = 32'b00000000010111110110000010100010;
		correct = 32'b00100011010101100110111101001100;
		#400 //1.1624531e-17 * 8.759037e-39 = 1.1624531e-17
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10010100001011111100111011000001;
		b = 32'b00000101001100100111110001001010;
		correct = 32'b10010100001011111100111011000001;
		#400 //-8.876017e-27 * 8.392348e-36 = -8.876017e-27
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11101101110001110001010011111100;
		b = 32'b00111101111010110011100001011000;
		correct = 32'b11101101110001110001010011111100;
		#400 //-7.7016107e+27 * 0.11485356 = -7.7016107e+27
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11011000111111111101010001111000;
		b = 32'b10001100011101110010000000100101;
		correct = 32'b11011000111111111101010001111000;
		#400 //-2250304100000000.0 * -1.9037861e-31 = -2250304100000000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10110111001101001100111101111011;
		b = 32'b11101010011000010001100011010100;
		correct = 32'b11101010011000010001100011010100;
		#400 //-1.0777144e-05 * -6.803139e+25 = -6.803139e+25
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00000011110000001111111110000101;
		b = 32'b11011000011100001011100010100010;
		correct = 32'b11011000011100001011100010100010;
		#400 //1.134341e-36 * -1058703100000000.0 = -1058703100000000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00101011100101101101010000110000;
		b = 32'b11110101000100010000110101010100;
		correct = 32'b11110101000100010000110101010100;
		#400 //1.0717035e-12 * -1.8387533e+32 = -1.8387533e+32
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01000100101110000101100010010101;
		b = 32'b11011110000010101101111001011100;
		correct = 32'b11011110000010101101111001011100;
		#400 //1474.7682 * -2.5016341e+18 = -2.5016341e+18
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00101111010010101000010110111101;
		b = 32'b10000011000100101010110000010110;
		correct = 32'b00101111010010101000010110111101;
		#400 //1.8419306e-10 * -4.310309e-37 = 1.8419306e-10
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11001100110110110111111101101100;
		b = 32'b01011111000001101001011110111100;
		correct = 32'b01011111000001101001011110111100;
		#400 //-115080030.0 * 9.698427e+18 = 9.698427e+18
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11001110011000110010101111011110;
		b = 32'b10001100000111000000011110100111;
		correct = 32'b11001110011000110010101111011110;
		#400 //-952825700.0 * -1.2020106e-31 = -952825700.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11100001001001000101010000000010;
		b = 32'b11111001010011010000010110111110;
		correct = 32'b11111001010011010000010110111110;
		#400 //-1.8945746e+20 * -6.6533583e+34 = -6.6533583e+34
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11011000001100000000011110111111;
		b = 32'b00100010011101101100010110101111;
		correct = 32'b11011000001100000000011110111111;
		#400 //-774189260000000.0 * 3.344387e-18 = -774189260000000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00001100010010011110110101101111;
		b = 32'b01110111110001110011110111111010;
		correct = 32'b01110111110001110011110111111010;
		#400 //1.5555927e-31 * 8.0822196e+33 = 8.0822196e+33
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11101000001011110100011011010011;
		b = 32'b01011111110010111011001001010001;
		correct = 32'b11101000001011110100011001101101;
		#400 //-3.3108824e+24 * 2.9355766e+19 = -3.310853e+24
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01001100100100001101001011111000;
		b = 32'b01110110110100010001000111001000;
		correct = 32'b01110110110100010001000111001000;
		#400 //75929540.0 * 2.1202162e+33 = 2.1202162e+33
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11111001101011001011111101001010;
		b = 32'b00011101010111010011111100000110;
		correct = 32'b11111001101011001011111101001010;
		#400 //-1.1211936e+35 * 2.9281689e-21 = -1.1211936e+35
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10010101011010010110001100111011;
		b = 32'b11110010111010100011010101001100;
		correct = 32'b11110010111010100011010101001100;
		#400 //-4.7132254e-26 * -9.2779423e+30 = -9.2779423e+30
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01110000101100000010101001111011;
		b = 32'b10010110001101100011010001110110;
		correct = 32'b01110000101100000010101001111011;
		#400 //4.3616574e+29 * -1.4718397e-25 = 4.3616574e+29
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01111000101110110000100101110010;
		b = 32'b11000100110001110101011000010110;
		correct = 32'b01111000101110110000100101110010;
		#400 //3.0348471e+34 * -1594.6902 = 3.0348471e+34
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01000001101110011101010001011001;
		b = 32'b10011101101000010010111010111110;
		correct = 32'b01000001101110011101010001011001;
		#400 //23.228685 * -4.2664675e-21 = 23.228685
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00000100100000111010111110011011;
		b = 32'b01111011000111101111011101111111;
		correct = 32'b01111011000111101111011101111111;
		#400 //3.095922e-36 * 8.254027e+35 = 8.254027e+35
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01101100100000111100100001011111;
		b = 32'b01001011010111011001110100101101;
		correct = 32'b01101100100000111100100001011111;
		#400 //1.274524e+27 * 14523693.0 = 1.274524e+27
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10111011100111100000101001001110;
		b = 32'b00100010010011101100101111100010;
		correct = 32'b10111011100111100000101001001110;
		#400 //-0.0048230058 * 2.802614e-18 = -0.0048230058
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10010001001000000000001110101110;
		b = 32'b10001000011000100001111101001000;
		correct = 32'b10010001001000000000001111100111;
		#400 //-1.2622908e-28 * -6.804617e-34 = -1.2622977e-28
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01101110100000010100100001101011;
		b = 32'b10110000111010110100100101110101;
		correct = 32'b01101110100000010100100001101011;
		#400 //2.0005557e+28 * -1.7119378e-09 = 2.0005557e+28
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00111101110110110101100001110101;
		b = 32'b10100101011011011001010110101000;
		correct = 32'b00111101110110110101100001110101;
		#400 //0.10710231 * -2.0607179e-16 = 0.10710231
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01010110110001011111111111100110;
		b = 32'b00110010111000100100000111111000;
		correct = 32'b01010110110001011111111111100110;
		#400 //108851430000000.0 * 2.6339862e-08 = 108851430000000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01000110111000110011111010110110;
		b = 32'b11101001100100000000000100011100;
		correct = 32'b11101001100100000000000100011100;
		#400 //29087.355 * -2.176132e+25 = -2.176132e+25
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00100110100010110001101100111100;
		b = 32'b11101001111110000100010000110110;
		correct = 32'b11101001111110000100010000110110;
		#400 //9.652444e-16 * -3.7516965e+25 = -3.7516965e+25
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00110001100100101101011110011110;
		b = 32'b00000110100000100101011001011100;
		correct = 32'b00110001100100101101011110011110;
		#400 //4.273672e-09 * 4.902746e-35 = 4.273672e-09
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01100001110111001111001101010110;
		b = 32'b00111100100001100011011000000001;
		correct = 32'b01100001110111001111001101010110;
		#400 //5.0947724e+20 * 0.016383173 = 5.0947724e+20
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11001001101100001000010100000110;
		b = 32'b10011001100010010001110101000011;
		correct = 32'b11001001101100001000010100000110;
		#400 //-1446048.8 * -1.4177287e-23 = -1446048.8
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11001111010001101010000101010101;
		b = 32'b01011001000010010100001010000111;
		correct = 32'b01011001000010010100001001111011;
		#400 //-3332461800.0 * 2414701200000000.0 = 2414698000000000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10101011000101001100001000100001;
		b = 32'b11100001111100010110101000011010;
		correct = 32'b11100001111100010110101000011010;
		#400 //-5.284957e-13 * -5.5666384e+20 = -5.5666384e+20
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11011100011011010010011001010010;
		b = 32'b11110111100110111010000110001100;
		correct = 32'b11110111100110111010000110001100;
		#400 //-2.6700681e+17 * -6.313145e+33 = -6.313145e+33
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01000111001100111110100001000000;
		b = 32'b00100110110010100110100110111001;
		correct = 32'b01000111001100111110100001000000;
		#400 //46056.25 * 1.4045222e-15 = 46056.25
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01111100011111011101011110100100;
		b = 32'b01111110011111100100111100010100;
		correct = 32'b01111110100001110001011001000111;
		#400 //5.2720993e+36 * 8.4508627e+37 = 8.978073e+37
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11111110101101000111111000100100;
		b = 32'b11001010001010010001111101000000;
		correct = 32'b11111110101101000111111000100100;
		#400 //-1.19958e+38 * -2770896.0 = -1.19958e+38
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00000100111100110010110110001001;
		b = 32'b01111010011101101111110100010001;
		correct = 32'b01111010011101101111110100010001;
		#400 //5.7170843e-36 * 3.2060946e+35 = 3.2060946e+35
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00110110000100101000001111100101;
		b = 32'b01110101000010101011101110110111;
		correct = 32'b01110101000010101011101110110111;
		#400 //2.1832468e-06 * 1.758653e+32 = 1.758653e+32
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01100010000111101000100101100011;
		b = 32'b01111110100011100110010011001011;
		correct = 32'b01111110100011100110010011001011;
		#400 //7.311213e+20 * 9.463686e+37 = 9.463686e+37
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11100011011011001101101011011101;
		b = 32'b01001110011000111111111001100000;
		correct = 32'b11100011011011001101101011011101;
		#400 //-4.3692024e+21 * 956274700.0 = -4.3692024e+21
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10111010100001101011001101110101;
		b = 32'b01001110001110101111100011100101;
		correct = 32'b01001110001110101111100011100101;
		#400 //-0.0010276871 * 784218430.0 = 784218430.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01001110100111001111010101100001;
		b = 32'b00010111000010111010010010010100;
		correct = 32'b01001110100111001111010101100001;
		#400 //1316663400.0 * 4.512105e-25 = 1316663400.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11101001111001110101000110001010;
		b = 32'b00000001111101000010011111110000;
		correct = 32'b11101001111001110101000110001010;
		#400 //-3.4955865e+25 * 8.968875e-38 = -3.4955865e+25
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11010000110000001000111111111111;
		b = 32'b01010101100000011100101100011011;
		correct = 32'b01010101100000011001101011110111;
		#400 //-25845300000.0 * 17838666000000.0 = 17812821000000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00111101110001100010001011010001;
		b = 32'b10011000001100110111001101100101;
		correct = 32'b00111101110001100010001011010001;
		#400 //0.096746095 * -2.3193467e-24 = 0.096746095
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00010110010111011100101111110000;
		b = 32'b10001101001111010010000011111011;
		correct = 32'b00010110010111011100101111000001;
		#400 //1.7916589e-25 * -5.827982e-31 = 1.7916531e-25
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10011110101001000111000001011000;
		b = 32'b01111111010101110111111011110010;
		correct = 32'b01111111010101110111111011110010;
		#400 //-1.741064e-20 * 2.8644316e+38 = 2.8644316e+38
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00111001000010110011101001110010;
		b = 32'b00110000001010110100111011010100;
		correct = 32'b00111001000010110011101010011101;
		#400 //0.00013277846 * 6.232146e-10 = 0.00013277908
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00101101000111100100000000101011;
		b = 32'b01000101101101111000011001001001;
		correct = 32'b01000101101101111000011001001001;
		#400 //8.995508e-12 * 5872.7856 = 5872.7856
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10111111011100001010110010100010;
		b = 32'b00010000011001101101001001010100;
		correct = 32'b10111111011100001010110010100010;
		#400 //-0.94013417 * 4.5521533e-29 = -0.94013417
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01010111011111000100010001000110;
		b = 32'b11110010000011010010110001101111;
		correct = 32'b11110010000011010010110001101111;
		#400 //277370160000000.0 * -2.7962306e+30 = -2.7962306e+30
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11101110010100111100100111101000;
		b = 32'b11101100001011101100101101001001;
		correct = 32'b11101110010111101011011010011101;
		#400 //-1.6386357e+28 * -8.452523e+26 = -1.723161e+28
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01100001000010011011111110111000;
		b = 32'b11111111001011101001010010010100;
		correct = 32'b11111111001011101001010010010100;
		#400 //1.5881367e+20 * -2.3205713e+38 = -2.3205713e+38
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01111000101011100011000110001000;
		b = 32'b11000010011000101111000101100110;
		correct = 32'b01111000101011100011000110001000;
		#400 //2.8264508e+34 * -56.73574 = 2.8264508e+34
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00011100101011100000110010111111;
		b = 32'b10001010110001110011111110001000;
		correct = 32'b00011100101011100000110010111111;
		#400 //1.1517649e-21 * -1.9186901e-32 = 1.1517649e-21
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01010100000010000011110111110010;
		b = 32'b11100001001010011101011111101101;
		correct = 32'b11100001001010011101011111101101;
		#400 //2340619300000.0 * -1.9581618e+20 = -1.9581618e+20
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00111100110100100000100101111100;
		b = 32'b10110111000011110110110100010101;
		correct = 32'b00111100110100011111011110001110;
		#400 //0.025639288 * -8.548862e-06 = 0.025630739
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11010001110101100110101010001110;
		b = 32'b11100110101011100101000100101000;
		correct = 32'b11100110101011100101000100101000;
		#400 //-115113840000.0 * -4.1159442e+23 = -4.1159442e+23
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10001011111101111111110010101101;
		b = 32'b10001100000001000101000011010110;
		correct = 32'b10001100100000000010011110010110;
		#400 //-9.5521124e-32 * -1.0193236e-31 = -1.9745348e-31
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01000001110000001011110001100001;
		b = 32'b10111101001110101011111010010101;
		correct = 32'b01000001110000000101111100000010;
		#400 //24.091982 * -0.04559191 = 24.04639
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00101000011110101011001000111011;
		b = 32'b00111000000011100011111000100101;
		correct = 32'b00111000000011100011111000100101;
		#400 //1.3916435e-14 * 3.3913315e-05 = 3.3913315e-05
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10101100101011011111011110000101;
		b = 32'b10010100111010111100110101000101;
		correct = 32'b10101100101011011111011110000101;
		#400 //-4.944436e-12 * -2.38099e-26 = -4.944436e-12
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11111110100011000011001001010100;
		b = 32'b10101000001000111001000011100101;
		correct = 32'b11111110100011000011001001010100;
		#400 //-9.317662e+37 * -9.079737e-15 = -9.317662e+37
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10111110101101110011001001100110;
		b = 32'b01001110010110111001000000111000;
		correct = 32'b01001110010110111001000000111000;
		#400 //-0.35780638 * 920915460.0 = 920915460.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01001010000001000010110000010011;
		b = 32'b10110000111111001111010111110000;
		correct = 32'b01001010000001000010110000010011;
		#400 //2165508.8 * -1.8405313e-09 = 2165508.8
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00000100101111011000111010010001;
		b = 32'b10011111101111110110010100111101;
		correct = 32'b10011111101111110110010100111101;
		#400 //4.4564613e-36 * -8.105913e-20 = -8.105913e-20
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11010000101111110110101111110000;
		b = 32'b00111111110111111001010010110000;
		correct = 32'b11010000101111110110101111110000;
		#400 //-25692176000.0 * 1.7467251 = -25692176000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01011001100001111101010110010101;
		b = 32'b00101011110011100001011101111100;
		correct = 32'b01011001100001111101010110010101;
		#400 //4779244700000000.0 * 1.4643699e-12 = 4779244700000000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01011110110010101001010001011111;
		b = 32'b00101101111010000110011110001100;
		correct = 32'b01011110110010101001010001011111;
		#400 //7.2986984e+18 * 2.642133e-11 = 7.2986984e+18
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01110001000100110110110110001110;
		b = 32'b10001000001101111100111111111010;
		correct = 32'b01110001000100110110110110001110;
		#400 //7.3002784e+29 * -5.5314035e-34 = 7.3002784e+29
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01110110010101110100110001001001;
		b = 32'b11010000000011001111111010110010;
		correct = 32'b01110110010101110100110001001001;
		#400 //1.0916905e+33 * -9462008000.0 = 1.0916905e+33
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10000101110001001010110011011011;
		b = 32'b11000110000110010001100001011011;
		correct = 32'b11000110000110010001100001011011;
		#400 //-1.8495248e-35 * -9798.089 = -9798.089
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10111101000001001010010100100110;
		b = 32'b00101000001010100101010111100110;
		correct = 32'b10111101000001001010010100100110;
		#400 //-0.03238406 * 9.455522e-15 = -0.03238406
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01101101011110011000100011100011;
		b = 32'b10010001111101110101001100001100;
		correct = 32'b01101101011110011000100011100011;
		#400 //4.8267033e+27 * -3.902091e-28 = 4.8267033e+27
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11000111110101101100000100001011;
		b = 32'b11001011010111100100100111111010;
		correct = 32'b11001011010111111111011101111100;
		#400 //-109954.086 * -14567930.0 = -14677884.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10110000111100011001011111000010;
		b = 32'b11100101010111110001001000101000;
		correct = 32'b11100101010111110001001000101000;
		#400 //-1.757819e-09 * -6.5838916e+22 = -6.5838916e+22
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11110101101001110100100101011010;
		b = 32'b10111011101000001101110011000011;
		correct = 32'b11110101101001110100100101011010;
		#400 //-4.2412174e+32 * -0.0049091293 = -4.2412174e+32
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00100010100111010011111011010100;
		b = 32'b10000000100100001110101101100111;
		correct = 32'b00100010100111010011111011010100;
		#400 //4.2621457e-18 * -1.3308758e-38 = 4.2621457e-18
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10111100000100001101011101010110;
		b = 32'b01111000010000011010101110000000;
		correct = 32'b01111000010000011010101110000000;
		#400 //-0.008840403 * 1.5712371e+34 = 1.5712371e+34
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00101110010100000001111110100001;
		b = 32'b11110100111100100011000001100101;
		correct = 32'b11110100111100100011000001100101;
		#400 //4.7321817e-11 * -1.5350554e+32 = -1.5350554e+32
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01001110110000001010100110101110;
		b = 32'b01110000110111101011011101010101;
		correct = 32'b01110000110111101011011101010101;
		#400 //1616172800.0 * 5.5141846e+29 = 5.5141846e+29
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01111010111011011001001001001111;
		b = 32'b11000100011111100100011011000001;
		correct = 32'b01111010111011011001001001001111;
		#400 //6.1677092e+35 * -1017.1055 = 6.1677092e+35
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11001010011111110000000010110110;
		b = 32'b11111001100010000111011100000101;
		correct = 32'b11111001100010000111011100000101;
		#400 //-4177965.5 * -8.85708e+34 = -8.85708e+34
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01100110110010001100101011110111;
		b = 32'b11011010100010010010111111110110;
		correct = 32'b01100110110010001100101011110110;
		#400 //4.7410867e+23 * -1.9307403e+16 = 4.7410863e+23
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01100101011011000001010001000100;
		b = 32'b10110001111110111110001001110100;
		correct = 32'b01100101011011000001010001000100;
		#400 //6.967827e+22 * -7.330806e-09 = 6.967827e+22
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11101000101001000010100011010101;
		b = 32'b01100100010100010100110100010001;
		correct = 32'b11101000101000111100000000101110;
		#400 //-6.2017706e+24 * 1.5443691e+22 = -6.1863266e+24
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11111010101010000111101100011110;
		b = 32'b11100100101011000000011010111001;
		correct = 32'b11111010101010000111101100011110;
		#400 //-4.374015e+35 * -2.5386595e+22 = -4.374015e+35
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00100111001101100010111010011100;
		b = 32'b01001011001001010011001000111100;
		correct = 32'b01001011001001010011001000111100;
		#400 //2.528284e-15 * 10826300.0 = 10826300.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01001000101111100010001001011011;
		b = 32'b00000010010100000110011111000110;
		correct = 32'b01001000101111100010001001011011;
		#400 //389394.84 * 1.5311208e-37 = 389394.84
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01101110011101110010100011110111;
		b = 32'b00011101110101101001111000001111;
		correct = 32'b01101110011101110010100011110111;
		#400 //1.912308e+28 * 5.6808757e-21 = 1.912308e+28
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00000110100101011101001101010011;
		b = 32'b10011000011100100000011001001111;
		correct = 32'b10011000011100100000011001001111;
		#400 //5.6358084e-35 * -3.1280952e-24 = -3.1280952e-24
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11010111000000010001000111001001;
		b = 32'b10001011010010101101011111001101;
		correct = 32'b11010111000000010001000111001001;
		#400 //-141913390000000.0 * -3.9066135e-32 = -141913390000000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01000110111000010001111000000101;
		b = 32'b00100010100011100111010100111000;
		correct = 32'b01000110111000010001111000000101;
		#400 //28815.01 * 3.8613287e-18 = 28815.01
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01100100000100100000001110011111;
		b = 32'b11101100001000000010110111111010;
		correct = 32'b11101100001000000010110101101000;
		#400 //1.0773942e+22 * -7.74581e+26 = -7.745702e+26
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10010111101100000010001001011010;
		b = 32'b10011111011000101101110000001101;
		correct = 32'b10011111011000101101110101101101;
		#400 //-1.1382405e-24 * -4.8039383e-20 = -4.804052e-20
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10111011010000100100000000000001;
		b = 32'b11110000100101010111000001010010;
		correct = 32'b11110000100101010111000001010010;
		#400 //-0.00296402 * -3.6999243e+29 = -3.6999243e+29
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01011001110101101010101110100110;
		b = 32'b00000011001100101101010111111110;
		correct = 32'b01011001110101101010101110100110;
		#400 //7553047000000000.0 * 5.255515e-37 = 7553047000000000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01100010000010111010000010000101;
		b = 32'b11011111101110011100010011010100;
		correct = 32'b01100010000001011101001001011110;
		#400 //6.43916e+20 * -2.6772114e+19 = 6.171439e+20
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01110101011101110110011101100101;
		b = 32'b00100101001000000011010101011110;
		correct = 32'b01110101011101110110011101100101;
		#400 //3.1362168e+32 * 1.3895869e-16 = 3.1362168e+32
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00101100100110111100110101011010;
		b = 32'b10100111110011111100101000111011;
		correct = 32'b00101100100110111001100101100111;
		#400 //4.4281636e-12 * -5.76733e-15 = 4.422396e-12
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10100101111011011000100101100100;
		b = 32'b01101011000010001010000101110000;
		correct = 32'b01101011000010001010000101110000;
		#400 //-4.1206046e-16 * 1.6517628e+26 = 1.6517628e+26
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10111100001101000100000000001000;
		b = 32'b01100111101111010100001001001100;
		correct = 32'b01100111101111010100001001001100;
		#400 //-0.011001594 * 1.7875005e+24 = 1.7875005e+24
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00111101010010101000011100100101;
		b = 32'b11011000011000101001000111001110;
		correct = 32'b11011000011000101001000111001110;
		#400 //0.04944529 * -996463400000000.0 = -996463400000000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11111000000110111010111000101111;
		b = 32'b01011110010100110010100101000101;
		correct = 32'b11111000000110111010111000101111;
		#400 //-1.2630295e+34 * 3.8039422e+18 = -1.2630295e+34
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01010010010011100011100010011111;
		b = 32'b10101100101110011000100101011111;
		correct = 32'b01010010010011100011100010011111;
		#400 //221428300000.0 * -5.2732675e-12 = 221428300000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01011100100000010110101011111100;
		b = 32'b01100011111100101101010111100000;
		correct = 32'b01100011111100101101011111100110;
		#400 //2.9142322e+17 * 8.959047e+21 = 8.9593384e+21
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01000111011011110100011011000010;
		b = 32'b11110010001011011110111001001111;
		correct = 32'b11110010001011011110111001001111;
		#400 //61254.758 * -3.4450563e+30 = -3.4450563e+30
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00000010111101111011001010000101;
		b = 32'b11101101000001111111001100000000;
		correct = 32'b11101101000001111111001100000000;
		#400 //3.6395853e-37 * -2.6296403e+27 = -2.6296403e+27
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10011011101010101111001100001110;
		b = 32'b00101110101110000100110011110101;
		correct = 32'b00101110101110000100110011110101;
		#400 //-2.828121e-22 * 8.3810216e-11 = 8.3810216e-11
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11001011110100001101001100010011;
		b = 32'b00000101100100010100011000011110;
		correct = 32'b11001011110100001101001100010011;
		#400 //-27371046.0 * 1.3661491e-35 = -27371046.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01000110111001001101010100111100;
		b = 32'b11001000001010111010001100110101;
		correct = 32'b11001000000011110000100010001110;
		#400 //29290.617 * -175756.83 = -146466.22
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11110101001101111001011000111111;
		b = 32'b10000100101001100000111000100000;
		correct = 32'b11110101001101111001011000111111;
		#400 //-2.3272404e+32 * -3.9039384e-36 = -2.3272404e+32
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11100000111100001101111011000111;
		b = 32'b00000111110000101000000110111000;
		correct = 32'b11100000111100001101111011000111;
		#400 //-1.3885223e+20 * 2.9266118e-34 = -1.3885223e+20
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00111011010000001100111101011000;
		b = 32'b11100100010010101101110011011101;
		correct = 32'b11100100010010101101110011011101;
		#400 //0.0029420462 * -1.4968629e+22 = -1.4968629e+22
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10101000100111100101011100010111;
		b = 32'b11000111110000111010111100001101;
		correct = 32'b11000111110000111010111100001101;
		#400 //-1.7579293e-14 * -100190.1 = -100190.1
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10100001101000111000000010011101;
		b = 32'b10000111010101001101011011110101;
		correct = 32'b10100001101000111000000010011101;
		#400 //-1.1079353e-18 * -1.6012278e-34 = -1.1079353e-18
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11001101011000000110000010100101;
		b = 32'b00101000010111011100110011010101;
		correct = 32'b11001101011000000110000010100101;
		#400 //-235276880.0 * 1.231238e-14 = -235276880.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11100110111000111100110000110101;
		b = 32'b00001000010100110011000100011000;
		correct = 32'b11100110111000111100110000110101;
		#400 //-5.3787207e+23 * 6.355321e-34 = -5.3787207e+23
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01100011011100011100100110001100;
		b = 32'b10110000111000110001110010101111;
		correct = 32'b01100011011100011100100110001100;
		#400 //4.4601883e+21 * -1.6524576e-09 = 4.4601883e+21
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01001111100101100010010110001010;
		b = 32'b10110010111000000000101010100010;
		correct = 32'b01001111100101100010010110001010;
		#400 //5038085000.0 * -2.6081867e-08 = 5038085000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01100011010111101000011111011100;
		b = 32'b01110111011000111110010100101110;
		correct = 32'b01110111011000111110010100101110;
		#400 //4.104967e+21 * 4.6222645e+33 = 4.6222645e+33
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01110111110100110110110100000111;
		b = 32'b00001011101100100001001111110111;
		correct = 32'b01110111110100110110110100000111;
		#400 //8.576453e+33 * 6.8593146e-32 = 8.576453e+33
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10111110100000010100000001110101;
		b = 32'b11011000110110011111111010011000;
		correct = 32'b11011000110110011111111010011000;
		#400 //-0.2524449 * -1917500000000000.0 = -1917500000000000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11010010111001100000011111000110;
		b = 32'b10001001110010101011001110100101;
		correct = 32'b11010010111001100000011111000110;
		#400 //-493986450000.0 * -4.8798668e-33 = -493986450000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11101111100011110010111110101011;
		b = 32'b00111001011000101111010010010110;
		correct = 32'b11101111100011110010111110101011;
		#400 //-8.862797e+28 * 0.00021644155 = -8.862797e+28
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10000101110000011001110011110010;
		b = 32'b11110011010100001010001111111111;
		correct = 32'b11110011010100001010001111111111;
		#400 //-1.8207285e-35 * -1.6530212e+31 = -1.6530212e+31
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10000100101011010101000011110110;
		b = 32'b01100001000011001010100111111110;
		correct = 32'b01100001000011001010100111111110;
		#400 //-4.0746455e-36 * 1.6217459e+20 = 1.6217459e+20
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11100101111101100110001011010100;
		b = 32'b01110111100111011010100010000100;
		correct = 32'b01110111100111011010100010000100;
		#400 //-1.4544065e+23 * 6.395379e+33 = 6.395379e+33
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10010110111000001011011000010101;
		b = 32'b00011011111000111110101100000011;
		correct = 32'b00011011111000111011001011010101;
		#400 //-3.6304062e-25 * 3.7705873e-22 = 3.7669567e-22
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01011101100011000001001111001000;
		b = 32'b10011000011001010110101000000011;
		correct = 32'b01011101100011000001001111001000;
		#400 //1.2617039e+18 * -2.9651079e-24 = 1.2617039e+18
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10100010110100111101010111110111;
		b = 32'b01110001110001110101001001100100;
		correct = 32'b01110001110001110101001001100100;
		#400 //-5.741821e-18 * 1.9739879e+30 = 1.9739879e+30
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11010011001011100110110000110001;
		b = 32'b11000100000011010110000101000010;
		correct = 32'b11010011001011100110110000110001;
		#400 //-749139460000.0 * -565.51965 = -749139460000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00101110010010100001000110000010;
		b = 32'b11001101111110110101010001111011;
		correct = 32'b11001101111110110101010001111011;
		#400 //4.5945033e-11 * -527077220.0 = -527077220.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10101011010101100000100111010111;
		b = 32'b01100001111000000000001101010100;
		correct = 32'b01100001111000000000001101010100;
		#400 //-7.604173e-13 * 5.165388e+20 = 5.165388e+20
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01000110111110101111101110010010;
		b = 32'b10011011111010110110011100010111;
		correct = 32'b01000110111110101111101110010010;
		#400 //32125.785 * -3.894411e-22 = 32125.785
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00011100000110010110111111001001;
		b = 32'b10101010111111000000101000100010;
		correct = 32'b10101010111111000000101000100010;
		#400 //5.076793e-22 * -4.4771223e-13 = -4.4771223e-13
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11001110111101111110000000011111;
		b = 32'b10010101000101111010100101100010;
		correct = 32'b11001110111101111110000000011111;
		#400 //-2079330200.0 * -3.0627827e-26 = -2079330200.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11010011111001110111010010011110;
		b = 32'b01100101111001001010010010101110;
		correct = 32'b01100101111001001010010010101110;
		#400 //-1988187900000.0 * 1.3496717e+23 = 1.3496717e+23
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11111100111010011110000111111101;
		b = 32'b00010101001000000100110011110110;
		correct = 32'b11111100111010011110000111111101;
		#400 //-9.71511e+36 * 3.2372454e-26 = -9.71511e+36
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10001011011111100000010010010011;
		b = 32'b01110111010000100001110001010100;
		correct = 32'b01110111010000100001110001010100;
		#400 //-4.8922062e-32 * 3.937032e+33 = 3.937032e+33
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11111011000101111000111010100001;
		b = 32'b01011110000011100101111110000001;
		correct = 32'b11111011000101111000111010100001;
		#400 //-7.869297e+35 * 2.564765e+18 = -7.869297e+35
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00100011111010110011010101000100;
		b = 32'b00001111111000000101111011100101;
		correct = 32'b00100011111010110011010101000100;
		#400 //2.550131e-17 * 2.2124657e-29 = 2.550131e-17
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11011110111010001011100011010101;
		b = 32'b01010000100110010111111011011011;
		correct = 32'b11011110111010001011100011010101;
		#400 //-8.3846937e+18 * 20601821000.0 = -8.3846937e+18
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01000101111111001110001010101001;
		b = 32'b10011111110110001000101011010110;
		correct = 32'b01000101111111001110001010101001;
		#400 //8092.3325 * -9.170924e-20 = 8092.3325
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00100110110111101100100101110111;
		b = 32'b01100111001110000001100100111111;
		correct = 32'b01100111001110000001100100111111;
		#400 //1.5458952e-15 * 8.6938114e+23 = 8.6938114e+23
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01010100110100111010110101111000;
		b = 32'b01010000100101100101110101000100;
		correct = 32'b01010100110101000100001111010101;
		#400 //7273187400000.0 * 20181557000.0 = 7293369000000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10110100000000010011101000110010;
		b = 32'b11001001001000110001010100100100;
		correct = 32'b11001001001000110001010100100100;
		#400 //-1.2035233e-07 * -667986.25 = -667986.25
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01111001101001001011110111110011;
		b = 32'b10100110110011000000110111000100;
		correct = 32'b01111001101001001011110111110011;
		#400 //1.0692366e+35 * -1.4159075e-15 = 1.0692366e+35
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01110101101100100110011011011010;
		b = 32'b11011100110000010111000001010010;
		correct = 32'b01110101101100100110011011011010;
		#400 //4.523022e+32 * -4.3558534e+17 = 4.523022e+32
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00111101010100000101110101000100;
		b = 32'b11000100001111100110110000101011;
		correct = 32'b11000100001111100110100011101010;
		#400 //0.050870195 * -761.6901 = -761.6393
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00111101111000011101101000011101;
		b = 32'b00010010001011100111001000010000;
		correct = 32'b00111101111000011101101000011101;
		#400 //0.1102793 * 5.504531e-28 = 0.1102793
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10100101001101111001100101011001;
		b = 32'b10101101010011000100101111110111;
		correct = 32'b10101101010011000100110010101111;
		#400 //-1.5924676e-16 * -1.1612925e-11 = -1.1613085e-11
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11010100000001111100110010110010;
		b = 32'b00000110001011001100001100011011;
		correct = 32'b11010100000001111100110010110010;
		#400 //-2333019200000.0 * 3.2492945e-35 = -2333019200000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01111110000111001101111110001001;
		b = 32'b11001101000100011101100100000110;
		correct = 32'b01111110000111001101111110001001;
		#400 //5.2130057e+37 * -152932450.0 = 5.2130057e+37
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01011011010011101110110101011100;
		b = 32'b11101100011011110011000100111110;
		correct = 32'b11101100011011110011000100111110;
		#400 //5.8244825e+16 * -1.15666324e+27 = -1.15666324e+27
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10001101001011111001001110100100;
		b = 32'b00100000011010000011111011011110;
		correct = 32'b00100000011010000011111011011110;
		#400 //-5.4103754e-31 * 1.9671965e-19 = 1.9671965e-19
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00111101011010110111001001001011;
		b = 32'b11000111001000100010001010101100;
		correct = 32'b11000111001000100010001010011101;
		#400 //0.057482045 * -41506.67 = -41506.613
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10010001000111001111110001010100;
		b = 32'b11111101101100001110010111001000;
		correct = 32'b11111101101100001110010111001000;
		#400 //-1.2383985e-28 * -2.9392152e+37 = -2.9392152e+37
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00110100010100000110110110001000;
		b = 32'b11010100000100010101111001101010;
		correct = 32'b11010100000100010101111001101010;
		#400 //1.9411357e-07 * -2497417000000.0 = -2497417000000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11110110111110000000101000010110;
		b = 32'b10010111000011010000111001111010;
		correct = 32'b11110110111110000000101000010110;
		#400 //-2.5154183e+33 * -4.557783e-25 = -2.5154183e+33
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11110100111110000011101101011010;
		b = 32'b00111111010001110100010100000000;
		correct = 32'b11110100111110000011101101011010;
		#400 //-1.5733562e+32 * 0.7783966 = -1.5733562e+32
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10110110100101001110101110001011;
		b = 32'b00001001100011110101010101110010;
		correct = 32'b10110110100101001110101110001011;
		#400 //-4.4381645e-06 * 3.450635e-33 = -4.4381645e-06
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00101110010000010000111110000110;
		b = 32'b00111010100101010001101111001110;
		correct = 32'b00111010100101010001101111001110;
		#400 //4.3896907e-11 * 0.0011376084 = 0.0011376084
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11110101010001100011110010000000;
		b = 32'b11000110111011001101111111011111;
		correct = 32'b11110101010001100011110010000000;
		#400 //-2.512944e+32 * -30319.936 = -2.512944e+32
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00011011000010111011111100011100;
		b = 32'b01110010110011000101101100000010;
		correct = 32'b01110010110011000101101100000010;
		#400 //1.1559561e-22 * 8.0953554e+30 = 8.0953554e+30
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00100111110001011010111001100110;
		b = 32'b01101101011000100110000100111011;
		correct = 32'b01101101011000100110000100111011;
		#400 //5.4867567e-15 * 4.3788223e+27 = 4.3788223e+27
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01100110000010001100001101100001;
		b = 32'b00001010101110111100111111010111;
		correct = 32'b01100110000010001100001101100001;
		#400 //1.6146149e+23 * 1.8085626e-32 = 1.6146149e+23
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00001011110100111001111011011100;
		b = 32'b00100001110000111101001110010010;
		correct = 32'b00100001110000111101001110010010;
		#400 //8.151327e-32 * 1.3269716e-18 = 1.3269716e-18
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01011010010011110111100100111011;
		b = 32'b11001001101111111011100010000011;
		correct = 32'b01011010010011110111100100111011;
		#400 //1.4599654e+16 * -1570576.4 = 1.4599654e+16
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10010010111111001001000001101010;
		b = 32'b10000000011110111011001100110111;
		correct = 32'b10010010111111001001000001101010;
		#400 //-1.5939037e-27 * -1.1360056e-38 = -1.5939037e-27
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10100111011000110011111000001110;
		b = 32'b11110110010100100011001001100011;
		correct = 32'b11110110010100100011001001100011;
		#400 //-3.1536218e-15 * -1.0658245e+33 = -1.0658245e+33
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11101111011001100000111110110010;
		b = 32'b11011011111101110111111001111101;
		correct = 32'b11101111011001100000111110110010;
		#400 //-7.1200527e+28 * -1.3932679e+17 = -7.1200527e+28
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01100111010000011110011111110011;
		b = 32'b01011101001101110011010001101010;
		correct = 32'b01100111010000011110011111111110;
		#400 //9.1569544e+23 * 8.250808e+17 = 9.156962e+23
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11101001111100111000101001111001;
		b = 32'b10001101111110000010000111100111;
		correct = 32'b11101001111100111000101001111001;
		#400 //-3.6802862e+25 * -1.5292342e-30 = -3.6802862e+25
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10010110000001111101100111110000;
		b = 32'b11011001101110100100111000111110;
		correct = 32'b11011001101110100100111000111110;
		#400 //-1.0973982e-25 * -6555047000000000.0 = -6555047000000000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00010110100101001110101001000110;
		b = 32'b01000111001010000101010111011010;
		correct = 32'b01000111001010000101010111011010;
		#400 //2.4058537e-25 * 43093.85 = 43093.85
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00101001100001001000100110101100;
		b = 32'b10110001111000110111001110100000;
		correct = 32'b10110001111000110111001100011011;
		#400 //5.88586e-14 * -6.6197146e-09 = -6.6196555e-09
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01101100011110001111111010110010;
		b = 32'b11101010111110011010000111101011;
		correct = 32'b01101100010110011100101001110101;
		#400 //1.2040655e+27 * -1.5089358e+26 = 1.0531719e+27
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11111110101101111110010101011011;
		b = 32'b10101010010101011000110111001001;
		correct = 32'b11111110101101111110010101011011;
		#400 //-1.222198e+38 * -1.8967392e-13 = -1.222198e+38
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10110001111011111110101110001011;
		b = 32'b10111100100101000111010011100001;
		correct = 32'b10111100100101000111010011100101;
		#400 //-6.9825936e-09 * -0.018122138 = -0.018122146
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01111110100000100110110110110100;
		b = 32'b11110101111000001011111110101101;
		correct = 32'b01111110100000100110110101111100;
		#400 //8.668463e+37 * -5.6980573e+32 = 8.668406e+37
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00011000001111011011111000000111;
		b = 32'b00011001100001010001000110110101;
		correct = 32'b00011001100111001100100101110110;
		#400 //2.4523617e-24 * 1.375903e-23 = 1.6211391e-23
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11101111111110000011101101001110;
		b = 32'b00001010110000110100111010101011;
		correct = 32'b11101111111110000011101101001110;
		#400 //-1.53647955e+29 * 1.8807409e-32 = -1.53647955e+29
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01000101010011001011010100001001;
		b = 32'b01000010110110011000111100001001;
		correct = 32'b01000101010100111000000110000001;
		#400 //3275.3147 * 108.779366 = 3384.094
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01010011111100100111001110000010;
		b = 32'b01000000010001110001101110001000;
		correct = 32'b01010011111100100111001110000010;
		#400 //2082640000000.0 * 3.1110554 = 2082640000000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11000110001101100111001010100110;
		b = 32'b11010001010011001110000010001100;
		correct = 32'b11010001010011001110000010001111;
		#400 //-11676.662 * -54996287000.0 = -54996300000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10010110101100000011111111110100;
		b = 32'b11110000101010010110110001001100;
		correct = 32'b11110000101010010110110001001100;
		#400 //-2.8474694e-25 * -4.194711e+29 = -4.194711e+29
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11100010010100011110101101011000;
		b = 32'b01110110011101101001000111010110;
		correct = 32'b01110110011101101001000111010110;
		#400 //-9.6808195e+20 * 1.2502568e+33 = 1.2502568e+33
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00101101110110001100100100100011;
		b = 32'b00001011101001000010010101111100;
		correct = 32'b00101101110110001100100100100011;
		#400 //2.464568e-11 * 6.32269e-32 = 2.464568e-11
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00100111010000001111000111000001;
		b = 32'b10111000101100001010110000011000;
		correct = 32'b10111000101100001010110000011000;
		#400 //2.6776408e-15 * -8.424389e-05 = -8.424389e-05
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00100010000001111100011001011001;
		b = 32'b00000101000010010000010010000110;
		correct = 32'b00100010000001111100011001011001;
		#400 //1.8400916e-18 * 6.44254e-36 = 1.8400916e-18
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00110111001101001011101010010001;
		b = 32'b10001101101011001010001001111101;
		correct = 32'b00110111001101001011101010010001;
		#400 //1.0772274e-05 * -1.0639436e-30 = 1.0772274e-05
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00011010010010011000100110010101;
		b = 32'b10111100101001111000010100100101;
		correct = 32'b10111100101001111000010100100101;
		#400 //4.1676964e-23 * -0.02044923 = -0.02044923
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01111001010000101100110110110100;
		b = 32'b10100111100101100100110100101111;
		correct = 32'b01111001010000101100110110110100;
		#400 //6.321736e+34 * -4.1717046e-15 = 6.321736e+34
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00111101000111110110111111110011;
		b = 32'b00000110101001101100110111001001;
		correct = 32'b00111101000111110110111111110011;
		#400 //0.038925122 * 6.2744634e-35 = 0.038925122
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11110010110110111101110100010000;
		b = 32'b11100101010011000111101110100110;
		correct = 32'b11110010110110111101110100010000;
		#400 //-8.7096916e+30 * -6.035273e+22 = -8.7096916e+30
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10001101010011100101010010001000;
		b = 32'b10011011110111101001010011110101;
		correct = 32'b10011011110111101001010011110101;
		#400 //-6.35804e-31 * -3.682308e-22 = -3.682308e-22
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11100100110110000100011011100010;
		b = 32'b10111010001011110010011111000111;
		correct = 32'b11100100110110000100011011100010;
		#400 //-3.1916835e+22 * -0.00066816475 = -3.1916835e+22
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11011111010110001011101011000000;
		b = 32'b10100100110100100011000011101000;
		correct = 32'b11011111010110001011101011000000;
		#400 //-1.5617006e+19 * -9.115583e-17 = -1.5617006e+19
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11110010011101000000011100110101;
		b = 32'b10111110011011110100100011100010;
		correct = 32'b11110010011101000000011100110101;
		#400 //-4.8334755e+30 * -0.23367646 = -4.8334755e+30
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01010000010010110000101000000010;
		b = 32'b01001001000001010010001111100101;
		correct = 32'b01010000010010110000110000010111;
		#400 //13625723000.0 * 545342.3 = 13626269000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00100011101000010010110010101100;
		b = 32'b10101000110000101000010011010010;
		correct = 32'b10101000110000100101110010000111;
		#400 //1.7474574e-17 * -2.1595928e-14 = -2.1578454e-14
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10010101101101111011010001000000;
		b = 32'b01101100110110110010001001100001;
		correct = 32'b01101100110110110010001001100001;
		#400 //-7.4197496e-26 * 2.1193368e+27 = 2.1193368e+27
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11011100001011111111011111011000;
		b = 32'b01101110000000010011000000010010;
		correct = 32'b01101110000000010011000000010010;
		#400 //-1.9812251e+17 * 9.99542e+27 = 9.99542e+27
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00001001011110010111000111011010;
		b = 32'b00011000000110110101000110111111;
		correct = 32'b00011000000110110101000110111111;
		#400 //3.0025818e-33 * 2.0074552e-24 = 2.0074552e-24
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10101111001110100101011111101000;
		b = 32'b00011001101110010011110010010000;
		correct = 32'b10101111001110100101011111101000;
		#400 //-1.6947832e-10 * 1.9153013e-23 = -1.6947832e-10
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01110010011101011100001011100001;
		b = 32'b11101110101011110011100001001101;
		correct = 32'b01110010011101000110010001110000;
		#400 //4.867803e+30 * -2.711397e+28 = 4.840689e+30
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01000000100001011101010111100011;
		b = 32'b01001001000010010000110111001100;
		correct = 32'b01001001000010010000111000001111;
		#400 //4.182359 * 561372.75 = 561376.94
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11010111101010101110110001010000;
		b = 32'b01100111010110010001010111010000;
		correct = 32'b01100111010110010001010111010000;
		#400 //-375863860000000.0 * 1.0251559e+24 = 1.0251559e+24
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00011010101110101101100000001111;
		b = 32'b10110000000000101010010001101101;
		correct = 32'b10110000000000101010010001101101;
		#400 //7.727686e-23 * -4.752739e-10 = -4.752739e-10
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11001011110111001100101100100010;
		b = 32'b10100010010100010011001011100010;
		correct = 32'b11001011110111001100101100100010;
		#400 //-28939844.0 * -2.8351719e-18 = -28939844.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11001010100101001110101100110000;
		b = 32'b10001001011110001000011100010110;
		correct = 32'b11001010100101001110101100110000;
		#400 //-4879768.0 * -2.9915431e-33 = -4879768.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00111010010110110111000010110111;
		b = 32'b01101110001100101110011001111110;
		correct = 32'b01101110001100101110011001111110;
		#400 //0.0008370983 * 1.3841745e+28 = 1.3841745e+28
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10011111101000011101110011111011;
		b = 32'b11100100100100011101011001010100;
		correct = 32'b11100100100100011101011001010100;
		#400 //-6.8551734e-20 * -2.1521775e+22 = -2.1521775e+22
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11001110010000010001001111000011;
		b = 32'b00110101101101011110010111011011;
		correct = 32'b11001110010000010001001111000011;
		#400 //-809824450.0 * 1.3552448e-06 = -809824450.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01100001011001010110001100111110;
		b = 32'b01111110010001110111001011101101;
		correct = 32'b01111110010001110111001011101101;
		#400 //2.6446597e+20 * 6.6278275e+37 = 6.6278275e+37
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10001010000010110000011101110100;
		b = 32'b00010010011101001100000010001100;
		correct = 32'b00010010011101001100000000000001;
		#400 //-6.694008e-33 * 7.7230157e-28 = 7.7229487e-28
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11010100101111000010000110001000;
		b = 32'b10100100010101011110011101011110;
		correct = 32'b11010100101111000010000110001000;
		#400 //-6464131300000.0 * -4.6382988e-17 = -6464131300000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11001101100111110011100001110010;
		b = 32'b10110111011000110011000000110010;
		correct = 32'b11001101100111110011100001110010;
		#400 //-333909570.0 * -1.3541476e-05 = -333909570.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00011000000001000110000001110000;
		b = 32'b11001100111111101111001011111101;
		correct = 32'b11001100111111101111001011111101;
		#400 //1.7109289e-24 * -133666790.0 = -133666790.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11001100001100000110100011001101;
		b = 32'b00011000000001001000010010000000;
		correct = 32'b11001100001100000110100011001101;
		#400 //-46244660.0 * 1.7127496e-24 = -46244660.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01100110000001001010000110010110;
		b = 32'b11101001110011110010111000101110;
		correct = 32'b11101001110011100010010011101011;
		#400 //1.5658328e+23 * -3.1308215e+25 = -3.1151632e+25
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11011000000011101111110101100100;
		b = 32'b10110100010010010101110001101010;
		correct = 32'b11011000000011101111110101100100;
		#400 //-628875800000000.0 * -1.8753204e-07 = -628875800000000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11000010110111010011001011000111;
		b = 32'b10101101011011000100101110000011;
		correct = 32'b11000010110111010011001011000111;
		#400 //-110.599174 * -1.3431814e-11 = -110.599174
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10010100010101000001000110000011;
		b = 32'b11010110001101101101011011100100;
		correct = 32'b11010110001101101101011011100100;
		#400 //-1.0706718e-26 * -50258516000000.0 = -50258516000000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11101010101100000010111011000110;
		b = 32'b01111101001001111111011000010010;
		correct = 32'b01111101001001111111011000010010;
		#400 //-1.0649591e+26 * 1.3953672e+37 = 1.3953672e+37
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11110001000001000001010101001000;
		b = 32'b00100100110101001011101010100011;
		correct = 32'b11110001000001000001010101001000;
		#400 //-6.54044e+29 * 9.225652e-17 = -6.54044e+29
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01010011010110001110011001110010;
		b = 32'b00110010111111000011100000101001;
		correct = 32'b01010011010110001110011001110010;
		#400 //931579170000.0 * 2.93622e-08 = 931579170000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10001001100001000111111001001010;
		b = 32'b00000011110110110110000001101111;
		correct = 32'b10001001100001000111000010010100;
		#400 //-3.1896606e-33 * 1.2893803e-36 = -3.1883712e-33
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11101100110101010100011110010111;
		b = 32'b11100000001010001101001001001101;
		correct = 32'b11101100110101010100011110010111;
		#400 //-2.0627142e+27 * -4.865948e+19 = -2.0627142e+27
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11110110110001110000100110101100;
		b = 32'b01000000011110001011110010001011;
		correct = 32'b11110110110001110000100110101100;
		#400 //-2.0184829e+33 * 3.8865077 = -2.0184829e+33
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11100011010000001010011001011010;
		b = 32'b01011101110100011111001110000110;
		correct = 32'b11100011010000001000110000011100;
		#400 //-3.5537618e+21 * 1.8910729e+18 = -3.5518708e+21
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10001010110000011010000011111110;
		b = 32'b10101101000100111101001011111010;
		correct = 32'b10101101000100111101001011111010;
		#400 //-1.8645782e-32 * -8.402829e-12 = -8.402829e-12
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11001101100111101011011110011011;
		b = 32'b00111000000011001000110001100111;
		correct = 32'b11001101100111101011011110011011;
		#400 //-332854100.0 * 3.350936e-05 = -332854100.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00101011111100000111010000000010;
		b = 32'b10110011111010000001000101111101;
		correct = 32'b10110011111010000001000010001101;
		#400 //1.7085224e-12 * -1.0806523e-07 = -1.08063524e-07
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01011110100101101011001111011000;
		b = 32'b10011001001001100111110111010110;
		correct = 32'b01011110100101101011001111011000;
		#400 //5.4296303e+18 * -8.607411e-24 = 5.4296303e+18
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01101000110000110101000110101001;
		b = 32'b01110100000100010010111110100100;
		correct = 32'b01110100000100010010111110100110;
		#400 //7.3789426e+24 * 4.601131e+31 = 4.601132e+31
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00000111111010011010000100100100;
		b = 32'b01100010000101111101000000111101;
		correct = 32'b01100010000101111101000000111101;
		#400 //3.5152653e-34 * 7.001159e+20 = 7.001159e+20
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11000001000011010000010000101101;
		b = 32'b01000100011101101011100011111001;
		correct = 32'b01000100011101001000010011101000;
		#400 //-8.8135195 * 986.8902 = 978.07666
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10100001011011100100111010001110;
		b = 32'b01010101101000110001000000110011;
		correct = 32'b01010101101000110001000000110011;
		#400 //-8.0741503e-19 * 22411246000000.0 = 22411246000000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11001110010101111010100001011000;
		b = 32'b00111001100110010100011011110000;
		correct = 32'b11001110010101111010100001011000;
		#400 //-904533500.0 * 0.00029235287 = -904533500.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10111110010111011101001001011100;
		b = 32'b10110110001110110011000110111111;
		correct = 32'b10111110010111011101001100010111;
		#400 //-0.21662277 * -2.7894127e-06 = -0.21662556
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00000100011101010101101000101001;
		b = 32'b11011100110010001011110111111011;
		correct = 32'b11011100110010001011110111111011;
		#400 //2.8841011e-36 * -4.5203105e+17 = -4.5203105e+17
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01101000100000001110000111011000;
		b = 32'b11100011110111000000100001111001;
		correct = 32'b01101000100000001010101011010110;
		#400 //4.869032e+24 * -8.1177884e+21 = 4.860914e+24
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11010011010101011010001110000100;
		b = 32'b01001100000010110111001101100100;
		correct = 32'b11010011010101011010000101010110;
		#400 //-917571400000.0 * 36556176.0 = -917534800000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11111101100001101111111111100010;
		b = 32'b00111001100111001000000111100111;
		correct = 32'b11111101100001101111111111100010;
		#400 //-2.2430646e+37 * 0.00029851423 = -2.2430646e+37
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01011001100110001010001001100000;
		b = 32'b01010101010110000001110001111010;
		correct = 32'b01011001100110010000111001101110;
		#400 //5370341000000000.0 * 14851051000000.0 = 5385192000000000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00111111100111010001001010000101;
		b = 32'b01010101111100111100001111100101;
		correct = 32'b01010101111100111100001111100101;
		#400 //1.2271277 * 33502836000000.0 = 33502836000000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00100100010010101000010110101101;
		b = 32'b00000010110001110001000100000111;
		correct = 32'b00100100010010101000010110101101;
		#400 //4.3914996e-17 * 2.9250195e-37 = 4.3914996e-17
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01011100101100100000001000101000;
		b = 32'b10001110011110011110010001110101;
		correct = 32'b01011100101100100000001000101000;
		#400 //4.0083933e+17 * -3.0801618e-30 = 4.0083933e+17
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11111000010001101010101001111101;
		b = 32'b10101100101000110111011110100010;
		correct = 32'b11111000010001101010101001111101;
		#400 //-1.6117698e+34 * -4.6460205e-12 = -1.6117698e+34
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01001010001110010101110100000101;
		b = 32'b10101000110101101100101111100010;
		correct = 32'b01001010001110010101110100000101;
		#400 //3036993.2 * -2.3847193e-14 = 3036993.2
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11010110101010001111000110111111;
		b = 32'b10101000101010010101110110110111;
		correct = 32'b11010110101010001111000110111111;
		#400 //-92878120000000.0 * -1.8803411e-14 = -92878120000000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01010010100100000001101010101011;
		b = 32'b10111111111110000110001000110000;
		correct = 32'b01010010100100000001101010101011;
		#400 //309461350000.0 * -1.9404964 = 309461350000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11111100000010011100010111000110;
		b = 32'b00010100111100100000010111111111;
		correct = 32'b11111100000010011100010111000110;
		#400 //-2.861424e+36 * 2.443812e-26 = -2.861424e+36
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00010000010111000111011101000110;
		b = 32'b10111110011111100011100101110111;
		correct = 32'b10111110011111100011100101110111;
		#400 //4.3479235e-29 * -0.24826609 = -0.24826609
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00000011000011101011110100100010;
		b = 32'b10010011100010111000111011101001;
		correct = 32'b10010011100010111000111011101001;
		#400 //4.1947163e-37 * -3.5229453e-27 = -3.5229453e-27
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10110001111010101101110111100110;
		b = 32'b00101001010011000101010011111001;
		correct = 32'b10110001111010101101110110000000;
		#400 //-6.8355233e-09 * 4.53708e-14 = -6.835478e-09
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10110001011000011111010111001111;
		b = 32'b00100110010101111111001110000001;
		correct = 32'b10110001011000011111010111001100;
		#400 //-3.2881535e-09 * 7.492312e-16 = -3.2881529e-09
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01110111001000111101100100110010;
		b = 32'b01000110011011110111111101110101;
		correct = 32'b01110111001000111101100100110010;
		#400 //3.3232408e+33 * 15327.864 = 3.3232408e+33
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10100001010001001011111111001000;
		b = 32'b01111011000001011010100000111010;
		correct = 32'b01111011000001011010100000111010;
		#400 //-6.6661203e-19 * 6.939875e+35 = 6.939875e+35
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00111101001000011100001100010100;
		b = 32'b11100001011111111110010000110100;
		correct = 32'b11100001011111111110010000110100;
		#400 //0.03949268 * -2.9502272e+20 = -2.9502272e+20
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00111110001011011111111011011001;
		b = 32'b00000010110110011100001100101011;
		correct = 32'b00111110001011011111111011011001;
		#400 //0.16991748 * 3.1997305e-37 = 0.16991748
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11010111001111100001100111100011;
		b = 32'b00111111011101001110000101000110;
		correct = 32'b11010111001111100001100111100011;
		#400 //-209018400000000.0 * 0.9565624 = -209018400000000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01110000001101000011000111100111;
		b = 32'b11010100001011001111111111111011;
		correct = 32'b01110000001101000011000111100111;
		#400 //2.2307052e+29 * -2972116000000.0 = 2.2307052e+29
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01011110101101111010001010001001;
		b = 32'b10101111001010011001100001101100;
		correct = 32'b01011110101101111010001010001001;
		#400 //6.6161446e+18 * -1.5424612e-10 = 6.6161446e+18
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00110011110101001000011101011101;
		b = 32'b00111001001101011100010111100101;
		correct = 32'b00111001001101011110000001110110;
		#400 //9.896642e-08 * 0.00017335227 = 0.00017345123
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01011110011111111100101101111111;
		b = 32'b10001011000011011001011110101100;
		correct = 32'b01011110011111111100101101111111;
		#400 //4.6079914e+18 * -2.7269717e-32 = 4.6079914e+18
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01110100001010111001001011010101;
		b = 32'b01100101101001110101010110111000;
		correct = 32'b01110100001010111001001011010101;
		#400 //5.437383e+31 * 9.877705e+22 = 5.437383e+31
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11110010001111001111011001000001;
		b = 32'b00001000111101010110011110010010;
		correct = 32'b11110010001111001111011001000001;
		#400 //-3.7427766e+30 * 1.476975e-33 = -3.7427766e+30
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11100000000110000110001001000010;
		b = 32'b11110001011101111100001110011110;
		correct = 32'b11110001011101111100001110011110;
		#400 //-4.3921646e+19 * -1.22686855e+30 = -1.22686855e+30
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01110110100101111010111011011101;
		b = 32'b10101000001110001010111011011100;
		correct = 32'b01110110100101111010111011011101;
		#400 //1.538249e+33 * -1.0251968e-14 = 1.538249e+33
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01111101111011101010101001110100;
		b = 32'b01100101101101100001101011100011;
		correct = 32'b01111101111011101010101001110100;
		#400 //3.9655163e+37 * 1.0749583e+23 = 3.9655163e+37
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11101010100101001111001000110100;
		b = 32'b01110011110001111101110000111001;
		correct = 32'b01110011110001111101110000010100;
		#400 //-9.00324e+25 * 3.166912e+31 = 3.166903e+31
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10111010011001001010010000100110;
		b = 32'b01000101000111001000111100011111;
		correct = 32'b01000101000111001000111100011011;
		#400 //-0.000872197 * 2504.945 = 2504.944
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10000001001111111001111101000011;
		b = 32'b10111100110000000001011000101011;
		correct = 32'b10111100110000000001011000101011;
		#400 //-3.5195424e-38 * -0.02344807 = -0.02344807
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00100111111100110011111111001100;
		b = 32'b11110001111001011000100010000011;
		correct = 32'b11110001111001011000100010000011;
		#400 //6.7515217e-15 * -2.2731872e+30 = -2.2731872e+30
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10011111110001100010011110001110;
		b = 32'b11111100000001010010110110101000;
		correct = 32'b11111100000001010010110110101000;
		#400 //-8.39217e-20 * -2.766006e+36 = -2.766006e+36
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10110111101111010000011001100101;
		b = 32'b00110010011011111110000101001001;
		correct = 32'b10110111101111001110100001101001;
		#400 //-2.2533533e-05 * 1.3962855e-08 = -2.251957e-05
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10101111000101010100000110101111;
		b = 32'b01001010011001001111100010111000;
		correct = 32'b01001010011001001111100010111000;
		#400 //-1.3574807e-10 * 3751470.0 = 3751470.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00110001101001010101111101011000;
		b = 32'b01100001010110000111000001110100;
		correct = 32'b01100001010110000111000001110100;
		#400 //4.8129714e-09 * 2.4953749e+20 = 2.4953749e+20
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10100101001011000001000111000001;
		b = 32'b10100101101100100010000001110001;
		correct = 32'b10100110000001000001010010101001;
		#400 //-1.4924637e-16 * -3.090006e-16 = -4.58247e-16
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00101100100011011100111000011111;
		b = 32'b11000000010000010010001011101000;
		correct = 32'b11000000010000010010001011101000;
		#400 //4.030345e-12 * -3.0177555 = -3.0177555
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11110111011011001011001110111001;
		b = 32'b00001101011001101011000011111101;
		correct = 32'b11110111011011001011001110111001;
		#400 //-4.8008878e+33 * 7.1087264e-31 = -4.8008878e+33
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11101010101001001110101010110010;
		b = 32'b10010010111001010011010101000100;
		correct = 32'b11101010101001001110101010110010;
		#400 //-9.968608e+25 * -1.4465063e-27 = -9.968608e+25
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10010000000110111111001101001000;
		b = 32'b00100110101001001000110000010010;
		correct = 32'b00100110101001001000110000010010;
		#400 //-3.0755777e-29 * 1.1417752e-15 = 1.1417752e-15
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11111100111111100101110011000001;
		b = 32'b11111101001110001101101000011001;
		correct = 32'b11111101100111000000010000111101;
		#400 //-1.05657974e+37 * -1.5356899e+37 = -2.5922697e+37
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10001010111011101110011011100001;
		b = 32'b10111111000101000010101110001110;
		correct = 32'b10111111000101000010101110001110;
		#400 //-2.3005413e-32 * -0.5787896 = -0.5787896
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11111001101110001001110001111000;
		b = 32'b11101001010101111000011001101000;
		correct = 32'b11111001101110001001110001111000;
		#400 //-1.1981952e+35 * -1.628461e+25 = -1.1981952e+35
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01000011101011101111100101111111;
		b = 32'b11101011000010101111000110101100;
		correct = 32'b11101011000010101111000110101100;
		#400 //349.9492 * -1.6797303e+26 = -1.6797303e+26
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00011100000111101111111100100100;
		b = 32'b10101110000010110000110010001101;
		correct = 32'b10101110000010110000110010001101;
		#400 //5.2607576e-22 * -3.1616088e-11 = -3.1616088e-11
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00110010000101111100100011010111;
		b = 32'b11010111011100010110100100000010;
		correct = 32'b11010111011100010110100100000010;
		#400 //8.8350225e-09 * -265433300000000.0 = -265433300000000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10001010111101100111001111001001;
		b = 32'b00101110011001101010000010011001;
		correct = 32'b00101110011001101010000010011001;
		#400 //-2.3732492e-32 * 5.2438585e-11 = 5.2438585e-11
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10001100101100000101100010111100;
		b = 32'b11111101000110110100010001011010;
		correct = 32'b11111101000110110100010001011010;
		#400 //-2.7170499e-31 * -1.2899078e+37 = -1.2899078e+37
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10001101011111001111111010001100;
		b = 32'b10001001100001001011010001000000;
		correct = 32'b10001101011111100000011111110100;
		#400 //-7.7959895e-31 * -3.194735e-33 = -7.8279366e-31
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00100101100011011111110110010100;
		b = 32'b01100101010010011110101010110110;
		correct = 32'b01100101010010011110101010110110;
		#400 //2.4631432e-16 * 5.959533e+22 = 5.959533e+22
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10011100100101111000011000011010;
		b = 32'b11011101011111010111000011110111;
		correct = 32'b11011101011111010111000011110111;
		#400 //-1.0027006e-21 * -1.141398e+18 = -1.141398e+18
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11010011110100001011010110110111;
		b = 32'b11111100111110111010111110100010;
		correct = 32'b11111100111110111010111110100010;
		#400 //-1792803700000.0 * -1.045463e+37 = -1.045463e+37
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00011000110101101100110001110001;
		b = 32'b01111110000001101110011001100110;
		correct = 32'b01111110000001101110011001100110;
		#400 //5.5524137e-24 * 4.482821e+37 = 4.482821e+37
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10101010100110110001000010101110;
		b = 32'b10010010110110100001110000001100;
		correct = 32'b10101010100110110001000010101110;
		#400 //-2.7545105e-13 * -1.3764648e-27 = -2.7545105e-13
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11001010111111011111011111101010;
		b = 32'b11001011000111110010101000111011;
		correct = 32'b11001011100011110001001100011000;
		#400 //-8322037.0 * -10431035.0 = -18753072.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00101000111111101011110000101000;
		b = 32'b01000011110000011010100000011111;
		correct = 32'b01000011110000011010100000011111;
		#400 //2.8281265e-14 * 387.31345 = 387.31345
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01101001101001011010011010001110;
		b = 32'b01111100000101010011111000000110;
		correct = 32'b01111100000101010011111000000110;
		#400 //2.5032412e+25 * 3.099641e+36 = 3.099641e+36
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01101000010100101101001101111110;
		b = 32'b00100001000101110000010011000000;
		correct = 32'b01101000010100101101001101111110;
		#400 //3.9823932e+24 * 5.1167077e-19 = 3.9823932e+24
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11001001110101101111001011010111;
		b = 32'b01000101001000001110010000111000;
		correct = 32'b11001001110101101010001001100101;
		#400 //-1760858.9 * 2574.2637 = -1758284.6
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00110011011101101101001000010111;
		b = 32'b01101100100100111001001101100001;
		correct = 32'b01101100100100111001001101100001;
		#400 //5.7467414e-08 * 1.4272646e+27 = 1.4272646e+27
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10100010000110101111100010111111;
		b = 32'b10101010111101001010001011110100;
		correct = 32'b10101010111101001010001101000001;
		#400 //-2.1002577e-18 * -4.3456178e-13 = -4.3456387e-13
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11101001011110100100110010011100;
		b = 32'b01101100100101111101100101010100;
		correct = 32'b01101100100101011110010010111011;
		#400 //-1.8912077e+25 * 1.4685928e+27 = 1.4496808e+27
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11100111101000111001110111011011;
		b = 32'b01011111000011100111001100000000;
		correct = 32'b11100111101000111001110110010100;
		#400 //-1.5453153e+24 * 1.0264548e+19 = -1.5453051e+24
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10100110100100011100000100011011;
		b = 32'b00010110000011101010010011011110;
		correct = 32'b10100110100100011100000100011011;
		#400 //-1.0113738e-15 * 1.1522692e-25 = -1.0113738e-15
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00000101011101001011010100000111;
		b = 32'b10001111010001101001110011100110;
		correct = 32'b10001111010001101001110011010111;
		#400 //1.1506074e-35 * -9.792371e-30 = -9.79236e-30
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11110010000011110010110100011010;
		b = 32'b00110111000110000000100101000010;
		correct = 32'b11110010000011110010110100011010;
		#400 //-2.8358964e+30 * 9.0620615e-06 = -2.8358964e+30
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00111110011111000100001100101100;
		b = 32'b10101110001001001100011110010010;
		correct = 32'b00111110011111000100001100101100;
		#400 //0.24634999 * -3.7466537e-11 = 0.24634999
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00101000100101111101001011001010;
		b = 32'b11110111100010001000110010010001;
		correct = 32'b11110111100010001000110010010001;
		#400 //1.6855783e-14 * -5.539089e+33 = -5.539089e+33
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00111111100010011010001001001110;
		b = 32'b10011101000101001011111001010101;
		correct = 32'b00111111100010011010001001001110;
		#400 //1.0752656 * -1.9686036e-21 = 1.0752656
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00100011000000001010011101001101;
		b = 32'b00100100011111100011001110001100;
		correct = 32'b00100100100011110010111010110000;
		#400 //6.974321e-18 * 5.5121132e-17 = 6.2095456e-17
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11110010100011000111011100011101;
		b = 32'b11110010100101000100111011011011;
		correct = 32'b11110011000100000110001011111100;
		#400 //-5.564403e+30 * -5.8750863e+30 = -1.143949e+31
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01110011101000001001111101001101;
		b = 32'b10110001100000111100001001000111;
		correct = 32'b01110011101000001001111101001101;
		#400 //2.5451614e+31 * -3.8346886e-09 = 2.5451614e+31
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01111001101100101010011011001100;
		b = 32'b01001010111010100110100001111001;
		correct = 32'b01111001101100101010011011001100;
		#400 //1.1595149e+35 * 7681084.5 = 1.1595149e+35
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11000110001111001100111111000111;
		b = 32'b00100000000000011000001001100101;
		correct = 32'b11000110001111001100111111000111;
		#400 //-12083.944 * 1.0969869e-19 = -12083.944
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00011011011000100010111100100111;
		b = 32'b10111110000110011111010101110011;
		correct = 32'b10111110000110011111010101110011;
		#400 //1.8709518e-22 * -0.15035038 = -0.15035038
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01101010001100101011010111000111;
		b = 32'b11100000000100110110101111010010;
		correct = 32'b01101010001100101011010110111110;
		#400 //5.4011804e+25 * -4.249126e+19 = 5.401176e+25
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00011010111000110100010111100110;
		b = 32'b00101001011000000001010001011110;
		correct = 32'b00101001011000000001010001011110;
		#400 //9.3997927e-23 * 4.9755657e-14 = 4.9755657e-14
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00010011011001010001011110001010;
		b = 32'b00101100101011010000111101100111;
		correct = 32'b00101100101011010000111101100111;
		#400 //2.891547e-27 * 4.9186657e-12 = 4.9186657e-12
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00000000011101100110011101001010;
		b = 32'b00001100001000000100000111101101;
		correct = 32'b00001100001000000100000111101110;
		#400 //1.0873642e-38 * 1.234579e-31 = 1.2345792e-31
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11100101011001010011000000100011;
		b = 32'b10111000110000011010101110110011;
		correct = 32'b11100101011001010011000000100011;
		#400 //-6.764437e+22 * -9.2349386e-05 = -6.764437e+22
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01011011110011011011111100111100;
		b = 32'b01001000011110010011011110100011;
		correct = 32'b01011011110011011011111100111100;
		#400 //1.1582527e+17 * 255198.55 = 1.1582527e+17
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00101101001100110011111001101111;
		b = 32'b00000110011011110011101101011010;
		correct = 32'b00101101001100110011111001101111;
		#400 //1.0188835e-11 * 4.499451e-35 = 1.0188835e-11
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10000100000110100011100011011011;
		b = 32'b11000101011101010100010011101110;
		correct = 32'b11000101011101010100010011101110;
		#400 //-1.812872e-36 * -3924.308 = -3924.308
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00101000010011100111111110110011;
		b = 32'b00111101001110000110101110001110;
		correct = 32'b00111101001110000110101110001110;
		#400 //1.14629875e-14 * 0.045024447 = 0.045024447
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10100010000100111000001010100001;
		b = 32'b00010101110110110000101111000101;
		correct = 32'b10100010000100111000001010100001;
		#400 //-1.999137e-18 * 8.8471965e-26 = -1.999137e-18
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11011110110111101110010000000100;
		b = 32'b00001101111000011011011101010111;
		correct = 32'b11011110110111101110010000000100;
		#400 //-8.0304833e+18 * 1.3910833e-30 = -8.0304833e+18
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10000010110111000111011111110101;
		b = 32'b11000100001101001010111001011001;
		correct = 32'b11000100001101001010111001011001;
		#400 //-3.2394947e-37 * -722.7242 = -722.7242
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00110111010000100000111101110101;
		b = 32'b10110010000111011011110000000111;
		correct = 32'b00110111010000011110100000000110;
		#400 //1.15669e-05 * -9.181355e-09 = 1.1557719e-05
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11001010111101000111001010000101;
		b = 32'b10110001100111101000000111010010;
		correct = 32'b11001010111101000111001010000101;
		#400 //-8010050.5 * -4.613164e-09 = -8010050.5
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00011001001011000110010010110110;
		b = 32'b11000111101111000010110010001111;
		correct = 32'b11000111101111000010110010001111;
		#400 //8.91253e-24 * -96345.12 = -96345.12
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01011100000100001111001010001001;
		b = 32'b10111000111100100101010111001010;
		correct = 32'b01011100000100001111001010001001;
		#400 //1.6319627e+17 * -0.00011555439 = 1.6319627e+17
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00011101100000100100100010011100;
		b = 32'b01100010010110110011110101111101;
		correct = 32'b01100010010110110011110101111101;
		#400 //3.448579e-21 * 1.0110669e+21 = 1.0110669e+21
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01000100010001010111000111001111;
		b = 32'b01001100111010111100111111001001;
		correct = 32'b01001100111010111101000000101100;
		#400 //789.77826 * 123633224.0 = 123634020.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00110101011100010110010111011110;
		b = 32'b00110000101101000010011000010001;
		correct = 32'b00110101011100011011111111110001;
		#400 //8.992773e-07 * 1.3107543e-09 = 9.005881e-07
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00000011000000100100011010000110;
		b = 32'b11110011011000101010011000111110;
		correct = 32'b11110011011000101010011000111110;
		#400 //3.8284523e-37 * -1.7957014e+31 = -1.7957014e+31
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00010110010010011000101000100110;
		b = 32'b11011010000001010010011111011000;
		correct = 32'b11011010000001010010011111011000;
		#400 //1.6280243e-25 * -9369995000000000.0 = -9369995000000000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01000001111001010001010100011010;
		b = 32'b11111110111110111011101111111000;
		correct = 32'b11111110111110111011101111111000;
		#400 //28.635303 * -1.6730611e+38 = -1.6730611e+38
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11101011100100001101001101011111;
		b = 32'b00111111110101011010011000101110;
		correct = 32'b11101011100100001101001101011111;
		#400 //-3.5016698e+26 * 1.6691339 = -3.5016698e+26
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01011100110111011010101101100111;
		b = 32'b11001010001010000100010010011101;
		correct = 32'b01011100110111011010101101100111;
		#400 //4.9915543e+17 * -2756903.2 = 4.9915543e+17
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11001100100010010010101000011100;
		b = 32'b01010101101010111111011110100000;
		correct = 32'b01010101101010111111011101111110;
		#400 //-71913700.0 * 23635004000000.0 = 23634932000000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10111110011101010011000001000110;
		b = 32'b00000110010000000001111001110110;
		correct = 32'b10111110011101010011000001000110;
		#400 //-0.23944196 * 3.6133566e-35 = -0.23944196
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11111101101111101010110111001101;
		b = 32'b11111011010000110011111101011110;
		correct = 32'b11111101110001001100011111001000;
		#400 //-3.1681968e+37 * -1.0137831e+36 = -3.2695751e+37
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00011111111000000111010001000101;
		b = 32'b00101110100111110100101101100001;
		correct = 32'b00101110100111110100101101100001;
		#400 //9.506004e-20 * 7.243873e-11 = 7.243873e-11
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01101111011011001111000010111001;
		b = 32'b10101100100110111100010101110101;
		correct = 32'b01101111011011001111000010111001;
		#400 //7.332948e+28 * -4.427287e-12 = 7.332948e+28
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01011001001110010111101101011011;
		b = 32'b00100110001101011001001010111001;
		correct = 32'b01011001001110010111101101011011;
		#400 //3263031300000000.0 * 6.2995836e-16 = 3263031300000000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00110101111010001100100010110111;
		b = 32'b10011011100111011000010100100011;
		correct = 32'b00110101111010001100100010110111;
		#400 //1.7343763e-06 * -2.605951e-22 = 1.7343763e-06
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10101111000111100000011100001000;
		b = 32'b01100101011010111001011010110110;
		correct = 32'b01100101011010111001011010110110;
		#400 //-1.4372514e-10 * 6.9533516e+22 = 6.9533516e+22
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11000011111001111011001001101101;
		b = 32'b00000100011111001001011011110101;
		correct = 32'b11000011111001111011001001101101;
		#400 //-463.39395 * 2.9691774e-36 = -463.39395
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10001101001111111011100000100100;
		b = 32'b00110100100110110101101101110100;
		correct = 32'b00110100100110110101101101110100;
		#400 //-5.907807e-31 * 2.893754e-07 = 2.893754e-07
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00111101001111010001010011000011;
		b = 32'b01111101101011110100111111100101;
		correct = 32'b01111101101011110100111111100101;
		#400 //0.046162378 * 2.9128717e+37 = 2.9128717e+37
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10010011111101001001011110100111;
		b = 32'b00001100111011101000111101111011;
		correct = 32'b10010011111101001001001111101101;
		#400 //-6.17438e-27 * 3.675606e-31 = -6.1740126e-27
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00110011101111101110010100110010;
		b = 32'b10000111010101000010000010011100;
		correct = 32'b00110011101111101110010100110010;
		#400 //8.889255e-08 * -1.595869e-34 = 8.889255e-08
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10100111011001000000100000011001;
		b = 32'b00101000000011010110001101111111;
		correct = 32'b00100111101010001100001011110010;
		#400 //-3.1645746e-15 * 7.848647e-15 = 4.6840727e-15
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11111010111011100011001110101001;
		b = 32'b11000001110110100100110100000110;
		correct = 32'b11111010111011100011001110101001;
		#400 //-6.1840722e+35 * -27.28761 = -6.1840722e+35
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11010011110000100110011110111010;
		b = 32'b00011000100000001010001010000111;
		correct = 32'b11010011110000100110011110111010;
		#400 //-1669927800000.0 * 3.3251335e-24 = -1669927800000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10001100010100111001000110110010;
		b = 32'b01101010010010011010011101011010;
		correct = 32'b01101010010010011010011101011010;
		#400 //-1.6298692e-31 * 6.0946096e+25 = 6.0946096e+25
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11100001001000000100000101011111;
		b = 32'b01100001111101010111011101001101;
		correct = 32'b01100001101001010101011010011110;
		#400 //-1.8476185e+20 * 5.660061e+20 = 3.8124427e+20
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01010000000100011111001110000000;
		b = 32'b01000010011001000000111010101101;
		correct = 32'b01010000000100011111001110000000;
		#400 //9794617000.0 * 57.01433 = 9794617000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00110100010111110100110011100010;
		b = 32'b00110100110110010010001001110111;
		correct = 32'b00110101001001000110010001110100;
		#400 //2.0796463e-07 * 4.0444476e-07 = 6.124094e-07
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11100100101101001110111101101111;
		b = 32'b10101111100110101100011110001011;
		correct = 32'b11100100101101001110111101101111;
		#400 //-2.6701336e+22 * -2.815422e-10 = -2.6701336e+22
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00001111111110010001111100111001;
		b = 32'b11101111111001101111001110011011;
		correct = 32'b11101111111001101111001110011011;
		#400 //2.4565322e-29 * -1.4295211e+29 = -1.4295211e+29
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		$display ("Done.");
		$finish;
	end

endmodule
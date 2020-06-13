`timescale 1 ns/1 ps
    `include "alu.v"


    module sub_tb ();
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

    op = 3'b001;

		/* Display the operation */
		$display ("Opcode: 001, Operation: SUB");
		/* Test Cases!*/
		a = 32'b01011100111000101001111111011110;
		b = 32'b00100101010111001000111111110011;
		correct = 32'b01011100111000101001111111011110;
		#400 //5.1031296e+17 * 1.913073e-16 = 5.1031296e+17
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00101001111101011111110101110110;
		b = 32'b10111110000011111100000111011101;
		correct = 32'b00111110000011111100000111011101;
		#400 //1.0924154e-13 * -0.14038797 = 0.14038797
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00010001011000101011001110001100;
		b = 32'b11010001111010110001100110000011;
		correct = 32'b01010001111010110001100110000011;
		#400 //1.7883584e-28 * -126218170000.0 = 126218170000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00111111100110110001010011010001;
		b = 32'b11011101000101101111011111101010;
		correct = 32'b01011101000101101111011111101010;
		#400 //1.2115728 * -6.799013e+17 = 6.799013e+17
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10101100010101100001100101010101;
		b = 32'b11110011010100101000101100000101;
		correct = 32'b01110011010100101000101100000101;
		#400 //-3.0425291e-12 * -1.6680939e+31 = 1.6680939e+31
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11100011010110001011001101111110;
		b = 32'b00010100010100101001110011100111;
		correct = 32'b11100011010110001011001101111110;
		#400 //-3.9974305e+21 * 1.0633234e-26 = -3.9974305e+21
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00111001001011111110000011110111;
		b = 32'b10001011111110011111110000000010;
		correct = 32'b00111001001011111110000011110111;
		#400 //0.00016773106 * -9.629049e-32 = 0.00016773106
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11101110010000110011000111010111;
		b = 32'b01111100110100010110000101110110;
		correct = 32'b11111100110100010110000101110110;
		#400 //-1.5102457e+28 * 8.697334e+36 = -8.697334e+36
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00101001101101100111001101111111;
		b = 32'b01101111001111100111010010111000;
		correct = 32'b11101111001111100111010010111000;
		#400 //8.102459e-14 * 5.8943256e+28 = -5.8943256e+28
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10111000011101010001011011011101;
		b = 32'b00110011111011100001001010001101;
		correct = 32'b10111000011101011000110111100110;
		#400 //-5.8433845e-05 * 1.1086113e-07 = -5.8544705e-05
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10111011111110100101000100001100;
		b = 32'b01111101010101010001000000110000;
		correct = 32'b11111101010101010001000000110000;
		#400 //-0.007639056 * 1.7700601e+37 = -1.7700601e+37
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01000001001110000001111100100000;
		b = 32'b11111001111100100100101101100011;
		correct = 32'b01111001111100100100101101100011;
		#400 //11.507599 * -1.5725811e+35 = 1.5725811e+35
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01001001110101111011011111011001;
		b = 32'b11010000011000011111011100111110;
		correct = 32'b01010000011000011111110111111100;
		#400 //1767163.1 * -15164307000.0 = 15166075000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10011101111110011101000101111000;
		b = 32'b00101111001010101110100111101000;
		correct = 32'b10101111001010101110100111101000;
		#400 //-6.6126337e-21 * 1.554451e-10 = -1.554451e-10
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00000110101101001111101001100100;
		b = 32'b10010010011110001010010000011100;
		correct = 32'b00010010011110001010010000011101;
		#400 //6.807639e-35 * -7.845728e-28 = 7.8457287e-28
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11101010011100101100100000101010;
		b = 32'b01011001100101011100000100011001;
		correct = 32'b11101010011100101100100000101010;
		#400 //-7.3376324e+25 * 5269010600000000.0 = -7.3376324e+25
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01001100100010011100110000100011;
		b = 32'b11010000100010010000011101000001;
		correct = 32'b01010000100010011001000100001101;
		#400 //72245530.0 * -18391632000.0 = 18463877000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10111001111110000011101110111010;
		b = 32'b00001011101111101111100001010111;
		correct = 32'b10111001111110000011101110111010;
		#400 //-0.00047346746 * 7.3559e-32 = -0.00047346746
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11001110011100000111001101101110;
		b = 32'b00000111100010010111110001010100;
		correct = 32'b11001110011100000111001101101110;
		#400 //-1008524160.0 * 2.0686542e-34 = -1008524160.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01100010000111110001000000001000;
		b = 32'b00101101111010111010100001011100;
		correct = 32'b01100010000111110001000000001000;
		#400 //7.335469e+20 * 2.6791173e-11 = 7.335469e+20
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10100000000010000010010000011001;
		b = 32'b11111110010101100011101101111101;
		correct = 32'b01111110010101100011101101111101;
		#400 //-1.1531592e-19 * -7.119092e+37 = 7.119092e+37
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01101010101110111101100101000000;
		b = 32'b01111110111001110011010010011110;
		correct = 32'b11111110111001110011010010011110;
		#400 //1.1354753e+26 * 1.5366244e+38 = -1.5366244e+38
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10111111110011101101110101001101;
		b = 32'b11111001111000100001011100001001;
		correct = 32'b01111001111000100001011100001001;
		#400 //-1.6161286 * -1.4674079e+35 = 1.4674079e+35
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01111001011101000011010100100110;
		b = 32'b10111111100110110100010010001000;
		correct = 32'b01111001011101000011010100100110;
		#400 //7.92499e+34 * -1.2130289 = 7.92499e+34
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11110101101101000111010111010001;
		b = 32'b00001110110010101100001111100100;
		correct = 32'b11110101101101000111010111010001;
		#400 //-4.57521e+32 * 4.998548e-30 = -4.57521e+32
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10100100010011110000000111001100;
		b = 32'b10000100000000101101010010110101;
		correct = 32'b10100100010011110000000111001100;
		#400 //-4.4887492e-17 * -1.5379097e-36 = -4.4887492e-17
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11010101100001111010000011010110;
		b = 32'b11110110100010000001010110000010;
		correct = 32'b01110110100010000001010110000010;
		#400 //-18640607000000.0 * -1.3800559e+33 = 1.3800559e+33
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01001010111000001101001001001011;
		b = 32'b01011110000011000011001100001100;
		correct = 32'b11011110000011000011001100001100;
		#400 //7366949.5 * 2.525608e+18 = -2.525608e+18
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10101001001010111100011101100101;
		b = 32'b01000101110010011001101010111000;
		correct = 32'b11000101110010011001101010111000;
		#400 //-3.8142575e-14 * 6451.34 = -6451.34
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00000001110001100111100100111111;
		b = 32'b11100001101111110110101001100101;
		correct = 32'b01100001101111110110101001100101;
		#400 //7.290769e-38 * -4.4137433e+20 = 4.4137433e+20
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10011011011011101111110011000000;
		b = 32'b01000010111110001011100101111101;
		correct = 32'b11000010111110001011100101111101;
		#400 //-1.9768567e-22 * 124.36228 = -124.36228
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00100111011011001100111111110111;
		b = 32'b10101001110110001011000110010110;
		correct = 32'b00101001111000000001100000010110;
		#400 //3.2864317e-15 * -9.623133e-14 = 9.9517765e-14
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00100010110011011010100111100001;
		b = 32'b01011111110000001000111100000011;
		correct = 32'b11011111110000001000111100000011;
		#400 //5.5745228e-18 * 2.7750625e+19 = -2.7750625e+19
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00010000100001001111101111000000;
		b = 32'b00011001101010110001110000111111;
		correct = 32'b10011001101010110001110000011110;
		#400 //5.24527e-29 * 1.7692394e-23 = -1.7692342e-23
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10100011110111001100101000100101;
		b = 32'b01010011100010011010001001000111;
		correct = 32'b11010011100010011010001001000111;
		#400 //-2.393806e-17 * 1182266200000.0 = -1182266200000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00111001111100010000001100010110;
		b = 32'b11111010010010010111000100100001;
		correct = 32'b01111010010010010111000100100001;
		#400 //0.000459694 * -2.6148655e+35 = 2.6148655e+35
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10001001110001110010101111000110;
		b = 32'b11110111001000000000001110000111;
		correct = 32'b01110111001000000000001110000111;
		#400 //-4.794867e-33 * -3.245465e+33 = 3.245465e+33
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10010110100011010011011011110101;
		b = 32'b00111000110111110111011110100000;
		correct = 32'b10111000110111110111011110100000;
		#400 //-2.2814461e-25 * 0.000106557505 = -0.000106557505
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01011101011110010111000110011100;
		b = 32'b00111100011110100011110111001101;
		correct = 32'b01011101011110010111000110011100;
		#400 //1.12339494e+18 * 0.0152735235 = 1.12339494e+18
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11011011101000000011000001000111;
		b = 32'b00111101000010010110001110001111;
		correct = 32'b11011011101000000011000001000111;
		#400 //-9.0178156e+16 * 0.033542212 = -9.0178156e+16
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00110110010010101101000000011001;
		b = 32'b10100100001110110101001101100100;
		correct = 32'b00110110010010101101000000011001;
		#400 //3.0221474e-06 * -4.0619796e-17 = 3.0221474e-06
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11110001101111011110001011111000;
		b = 32'b01010011101011101001000000111111;
		correct = 32'b11110001101111011110001011111000;
		#400 //-1.8805458e+30 * 1499488700000.0 = -1.8805458e+30
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11111100000110011101011001111111;
		b = 32'b01001111011111011000100111100110;
		correct = 32'b11111100000110011101011001111111;
		#400 //-3.1950877e+36 * 4253673000.0 = -3.1950877e+36
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10010101011000111101100100101010;
		b = 32'b11111011111010101001111111011100;
		correct = 32'b01111011111010101001111111011100;
		#400 //-4.6013597e-26 * -2.4364796e+36 = 2.4364796e+36
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00111001010001001001000000000010;
		b = 32'b10011111100110111101111010100011;
		correct = 32'b00111001010001001001000000000010;
		#400 //0.00018745664 * -6.6013375e-20 = 0.00018745664
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00011000101001100011001011011001;
		b = 32'b00101111000111011110101000111000;
		correct = 32'b10101111000111011110101000111000;
		#400 //4.2961337e-24 * 1.4362278e-10 = -1.4362278e-10
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01111000000010010100001101100110;
		b = 32'b11110110100110000100001001001100;
		correct = 32'b01111000000111000100101110110000;
		#400 //1.113612e+34 * -1.5440894e+33 = 1.268021e+34
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00100010100011000111111000011100;
		b = 32'b11000010100110101101110010101010;
		correct = 32'b01000010100110101101110010101010;
		#400 //3.80806e-18 * -77.430984 = 77.430984
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11100101111000111101001101110001;
		b = 32'b11100110111110011110101111011111;
		correct = 32'b01100110110000001111011100000011;
		#400 //-1.344847e+23 * -5.9011015e+23 = 4.5562546e+23
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11000011110000100110111110001111;
		b = 32'b00111010101111100011001000110101;
		correct = 32'b11000011110000100110111110111111;
		#400 //-388.87155 * 0.0014510812 = -388.87302
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10000000001011111101010100110000;
		b = 32'b10110001010100000000110010001101;
		correct = 32'b00110001010100000000110010001101;
		#400 //-4.392746e-39 * -3.0275118e-09 = 3.0275118e-09
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00100010100011101011111010010010;
		b = 32'b11000100111101110000111010110101;
		correct = 32'b01000100111101110000111010110101;
		#400 //3.869095e-18 * -1976.4596 = 1976.4596
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11000010011000010010011110110001;
		b = 32'b01100000100111011000001100101101;
		correct = 32'b11100000100111011000001100101101;
		#400 //-56.28876 * 9.079972e+19 = -9.079972e+19
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10011001001001111101111100000101;
		b = 32'b10101011010011111101000001110110;
		correct = 32'b00101011010011111101000001110110;
		#400 //-8.678736e-24 * -7.383047e-13 = 7.383047e-13
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10111111100101101101011100100000;
		b = 32'b01100101010011111011011110001110;
		correct = 32'b11100101010011111011011110001110;
		#400 //-1.1784401 * 6.130724e+22 = -6.130724e+22
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10001001011111000000010011110000;
		b = 32'b01101011111100000110000000111001;
		correct = 32'b11101011111100000110000000111001;
		#400 //-3.0335718e-33 * 5.811932e+26 = -5.811932e+26
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00011011010100000110100100000011;
		b = 32'b10011001011100000001000111001010;
		correct = 32'b00011011010111110110101000100000;
		#400 //1.7239288e-22 * -1.2411302e-23 = 1.8480418e-22
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11101101010111111111011000100100;
		b = 32'b10000011011000111011101100000110;
		correct = 32'b11101101010111111111011000100100;
		#400 //-4.3320452e+27 * -6.6923997e-37 = -4.3320452e+27
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10101110101010011011111100001110;
		b = 32'b10100001111111000101001000111010;
		correct = 32'b10101110101010011011111100001110;
		#400 //-7.7191684e-11 * -1.7097949e-18 = -7.7191684e-11
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00111010111101111100111100001000;
		b = 32'b00111100101000100111011011100011;
		correct = 32'b10111100100100101111100111110010;
		#400 //0.0018906305 * 0.01983208 = -0.017941449
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11101011110011011110110000110011;
		b = 32'b01000111100100011001110110010000;
		correct = 32'b11101011110011011110110000110011;
		#400 //-4.9789042e+26 * 74555.125 = -4.9789042e+26
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11000110101001101111101011111110;
		b = 32'b10110111001101001001000101011010;
		correct = 32'b11000110101001101111101011111110;
		#400 //-21373.496 * -1.0762678e-05 = -21373.496
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00010011010011011001110100000011;
		b = 32'b00001011000000110010000010111111;
		correct = 32'b00010011010011011001110010000000;
		#400 //2.595205e-27 * 2.5254318e-32 = 2.5951798e-27
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11001010000111100011011010010000;
		b = 32'b11111110110000010110100010010010;
		correct = 32'b01111110110000010110100010010010;
		#400 //-2592164.0 * -1.2854198e+38 = 1.2854198e+38
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10001110110000100011000011001100;
		b = 32'b00000000110011111111000001000100;
		correct = 32'b10001110110000100011000011001100;
		#400 //-4.7871682e-30 * 1.9096139e-38 = -4.7871682e-30
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01010110101110100101011111110110;
		b = 32'b01110100101101111101011110101010;
		correct = 32'b11110100101101111101011110101010;
		#400 //102443480000000.0 * 1.1652399e+32 = -1.1652399e+32
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00101010011111011100101000010001;
		b = 32'b10111111000001100011011010101001;
		correct = 32'b00111111000001100011011010101001;
		#400 //2.254102e-13 * -0.52427155 = 0.52427155
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01001100001001000111101001111011;
		b = 32'b00001001010100000001001011001110;
		correct = 32'b01001100001001000111101001111011;
		#400 //43117036.0 * 2.5045931e-33 = 43117036.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01010001000110101001100111011101;
		b = 32'b00101001010111100100110000010001;
		correct = 32'b01010001000110101001100111011101;
		#400 //41500398000.0 * 4.935988e-14 = 41500398000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01011100111010111110101001110110;
		b = 32'b10000010000111110001010110011101;
		correct = 32'b01011100111010111110101001110110;
		#400 //5.312353e+17 * -1.1687678e-37 = 5.312353e+17
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11010100011111011000111101001011;
		b = 32'b00111001100110011101000001110010;
		correct = 32'b11010100011111011000111101001011;
		#400 //-4356123100000.0 * 0.00029337738 = -4356123100000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10111111001101110000110100001011;
		b = 32'b00000001010100001000100010110001;
		correct = 32'b10111111001101110000110100001011;
		#400 //-0.71504277 * 3.8301638e-38 = -0.71504277
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11110110110111010100001111000110;
		b = 32'b01010001110010000001100001000100;
		correct = 32'b11110110110111010100001111000110;
		#400 //-2.243891e+33 * 107425070000.0 = -2.243891e+33
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11101111011011011110001011000111;
		b = 32'b00010111001001101110001111001000;
		correct = 32'b11101111011011011110001011000111;
		#400 //-7.3622104e+28 * 5.3924993e-25 = -7.3622104e+28
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00110000010101100101011010010101;
		b = 32'b01010110101001100001111010011110;
		correct = 32'b11010110101001100001111010011110;
		#400 //7.7975787e-10 * 91325215000000.0 = -91325215000000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00100010010010010011000111010011;
		b = 32'b01101000001011011011100111111001;
		correct = 32'b11101000001011011011100111111001;
		#400 //2.7266956e-18 * 3.2816e+24 = -3.2816e+24
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01010010010000100001010001011110;
		b = 32'b01100101100011100100011001110000;
		correct = 32'b11100101100011100100011001110000;
		#400 //208391340000.0 * 8.398442e+22 = -8.398442e+22
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00001100110100010110111011110101;
		b = 32'b10101011001000111111010010100010;
		correct = 32'b00101011001000111111010010100010;
		#400 //3.2268329e-31 * -5.824873e-13 = 5.824873e-13
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11111101001011111000100010101101;
		b = 32'b11000011011010101110001101100101;
		correct = 32'b11111101001011111000100010101101;
		#400 //-1.4582785e+37 * -234.88826 = -1.4582785e+37
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11010001111111100010010001101100;
		b = 32'b01011010001101001001000110111011;
		correct = 32'b11011010001101001001001000111010;
		#400 //-136441590000.0 * 1.2706432e+16 = -1.2706568e+16
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11011101000101100101100100110110;
		b = 32'b11010001010011000000010010000010;
		correct = 32'b11011101000101100101100100110101;
		#400 //-6.7710936e+17 * -54765560000.0 = -6.771093e+17
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11110000100101110101110101000010;
		b = 32'b10111110101100110100000010000101;
		correct = 32'b11110000100101110101110101000010;
		#400 //-3.7475983e+29 * -0.35010162 = -3.7475983e+29
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01011000100100011000001100100001;
		b = 32'b11110000001001100011010101000110;
		correct = 32'b01110000001001100011010101000110;
		#400 //1279939000000000.0 * -2.0575566e+29 = 2.0575566e+29
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00010101001010001110110110001001;
		b = 32'b01010011001011100101110101001000;
		correct = 32'b11010011001011100101110101001000;
		#400 //3.4114712e-26 * 748889300000.0 = -748889300000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10101100001000010110010101100000;
		b = 32'b00011000011100001011001011011010;
		correct = 32'b10101100001000010110010101100000;
		#400 //-2.293575e-12 * 3.110957e-24 = -2.293575e-12
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10111110110011101000011111011001;
		b = 32'b01110000110111000010001100000011;
		correct = 32'b11110000110111000010001100000011;
		#400 //-0.4033802 * 5.4503223e+29 = -5.4503223e+29
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10110001011100101100110000000010;
		b = 32'b00000001101110111000000111001000;
		correct = 32'b10110001011100101100110000000010;
		#400 //-3.53316e-09 * 6.887918e-38 = -3.53316e-09
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00000111010100011100110000100111;
		b = 32'b00101100010110110001001001101110;
		correct = 32'b10101100010110110001001001101110;
		#400 //1.5783407e-34 * 3.1132002e-12 = -3.1132002e-12
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11100010011011111101000110000001;
		b = 32'b01001001111111101111001000100010;
		correct = 32'b11100010011011111101000110000001;
		#400 //-1.10596705e+21 * 2088516.2 = -1.10596705e+21
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01011011000000110101000000000000;
		b = 32'b01110010111111111011111101110011;
		correct = 32'b11110010111111111011111101110011;
		#400 //3.6961183e+16 * 1.0131216e+31 = -1.0131216e+31
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11110001110001010010101010100111;
		b = 32'b01101010111000101111011100010010;
		correct = 32'b11110001110001010010111000110011;
		#400 //-1.9526435e+30 * 1.37192e+26 = -1.9527807e+30
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10011011101110110100000010101111;
		b = 32'b01010100000110101110001101000011;
		correct = 32'b11010100000110101110001101000011;
		#400 //-3.0978356e-22 * 2660951000000.0 = -2660951000000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10111100011001101100101011001111;
		b = 32'b10000101111111111010011010110111;
		correct = 32'b10111100011001101100101011001111;
		#400 //-0.014086439 * -2.4041326e-35 = -0.014086439
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01110010011000000101000101101011;
		b = 32'b00101110011001010100010001011011;
		correct = 32'b01110010011000000101000101101011;
		#400 //4.4430765e+30 * 5.2129284e-11 = 4.4430765e+30
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11111101101111101000110011001101;
		b = 32'b10001000001111100000110011000010;
		correct = 32'b11111101101111101000110011001101;
		#400 //-3.166055e+37 * -5.719104e-34 = -3.166055e+37
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10000111000111011001110001001101;
		b = 32'b11000111000110101110000011100010;
		correct = 32'b01000111000110101110000011100010;
		#400 //-1.18573e-34 * -39648.883 = 39648.883
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10001100001011111100100001000010;
		b = 32'b10110010011101101110000011001001;
		correct = 32'b00110010011101101110000011001001;
		#400 //-1.3541773e-31 * -1.4370195e-08 = 1.4370195e-08
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11001101000001001000111010011001;
		b = 32'b10101100011011011001011001100111;
		correct = 32'b11001101000001001000111010011001;
		#400 //-138996110.0 * -3.3763216e-12 = -138996110.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10111011110100100010001001000011;
		b = 32'b01011000111000011111100001111101;
		correct = 32'b11011000111000011111100001111101;
		#400 //-0.0064127757 * 1987658900000000.0 = -1987658900000000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00010111100110011000100001110110;
		b = 32'b00001001010001101111001110000100;
		correct = 32'b00010111100110011000100001110110;
		#400 //9.921841e-25 * 2.3947884e-33 = 9.921841e-25
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00001101110101001000101110100111;
		b = 32'b10001100100111011000010110100010;
		correct = 32'b00001101111110111110110100010000;
		#400 //1.3099129e-30 * -2.4270107e-31 = 1.552614e-30
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11000110111110011001000100101000;
		b = 32'b01001001001000001001011010000100;
		correct = 32'b11001001001010000110001100001101;
		#400 //-31944.578 * 657768.25 = -689712.8
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01000001000011000110111100100101;
		b = 32'b01111001110111000101000000000101;
		correct = 32'b11111001110111000101000000000101;
		#400 //8.777135 * 1.4299104e+35 = -1.4299104e+35
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10101110101000111010000011100111;
		b = 32'b11010111001110000101110111001100;
		correct = 32'b01010111001110000101110111001100;
		#400 //-7.440964e-11 * -202713000000000.0 = 202713000000000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01010000011011100110100001101010;
		b = 32'b11110011010000110010000001111110;
		correct = 32'b01110011010000110010000001111110;
		#400 //15999281000.0 * -1.5459548e+31 = 1.5459548e+31
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01100010111101111110011001110010;
		b = 32'b10011000001011101001110011100100;
		correct = 32'b01100010111101111110011001110010;
		#400 //2.2864756e+21 * -2.2568182e-24 = 2.2864756e+21
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11111001101110100101000110111101;
		b = 32'b00100000001111111000110000111101;
		correct = 32'b11111001101110100101000110111101;
		#400 //-1.2092813e+35 * 1.622473e-19 = -1.2092813e+35
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00110111101000010000001111010111;
		b = 32'b11110011111000010101001000001100;
		correct = 32'b01110011111000010101001000001100;
		#400 //1.9194484e-05 * -3.5703458e+31 = 3.5703458e+31
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11111011010011000110011101100000;
		b = 32'b01100111001111101111111111010111;
		correct = 32'b11111011010011000110011101100000;
		#400 //-1.06132525e+36 * 9.0196904e+23 = -1.06132525e+36
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11001111110111010000000000001111;
		b = 32'b01110111011001111100001001010100;
		correct = 32'b11110111011001111100001001010100;
		#400 //-7415537000.0 * 4.700633e+33 = -4.700633e+33
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01111000100000010000000010111001;
		b = 32'b11100001110110010010011011011101;
		correct = 32'b01111000100000010000000010111001;
		#400 //2.0931905e+34 * -5.0071798e+20 = 2.0931905e+34
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01010110000110001101010011000010;
		b = 32'b11100101000111101011010001011000;
		correct = 32'b01100101000111101011010001011000;
		#400 //42009890000000.0 * -4.684129e+22 = 4.684129e+22
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10001001101011010000111001010010;
		b = 32'b11001110010001100100001010011011;
		correct = 32'b01001110010001100100001010011011;
		#400 //-4.16617e-33 * -831563460.0 = 831563460.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00101001001111001011000111011011;
		b = 32'b10010101010010110011110000000100;
		correct = 32'b00101001001111001011000111011011;
		#400 //4.189865e-14 * -4.1042868e-26 = 4.189865e-14
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10010111111100000001100101011111;
		b = 32'b11111110100111001101110110001100;
		correct = 32'b01111110100111001101110110001100;
		#400 //-1.5516041e-24 * -1.0425495e+38 = 1.0425495e+38
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10011011001010001011101000011000;
		b = 32'b11001001011100110101100011011000;
		correct = 32'b01001001011100110101100011011000;
		#400 //-1.3956764e-22 * -996749.5 = 996749.5
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01100101000111111101000101110010;
		b = 32'b10011001001010110011100011011100;
		correct = 32'b01100101000111111101000101110010;
		#400 //4.716999e+22 * -8.8519755e-24 = 4.716999e+22
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11101100001100001110000110110101;
		b = 32'b10001001111111000111010101101111;
		correct = 32'b11101100001100001110000110110101;
		#400 //-8.5534726e+26 * -6.0777227e-33 = -8.5534726e+26
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10111011010001001111100111110110;
		b = 32'b00011111101101001011100110001101;
		correct = 32'b10111011010001001111100111110110;
		#400 //-0.0030056215 * 7.6539933e-20 = -0.0030056215
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01100110000111011000111000111011;
		b = 32'b00010100101101000011110000001100;
		correct = 32'b01100110000111011000111000111011;
		#400 //1.860088e+23 * 1.819904e-26 = 1.860088e+23
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00011110110100101011000010111010;
		b = 32'b10010101101110001001001000010101;
		correct = 32'b00011110110100101011000011101000;
		#400 //2.2307707e-20 * -7.4547485e-26 = 2.2307782e-20
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01001011100101000000001100010110;
		b = 32'b11110000100011010101010110111010;
		correct = 32'b01110000100011010101010110111010;
		#400 //19400236.0 * -3.499282e+29 = 3.499282e+29
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00101000110110101110100111010011;
		b = 32'b10111011010001111001011111010100;
		correct = 32'b00111011010001111001011111010100;
		#400 //2.4304267e-14 * -0.0030455487 = 0.0030455487
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11011110110001000011110000001110;
		b = 32'b00100100010011001001110001001011;
		correct = 32'b11011110110001000011110000001110;
		#400 //-7.070096e+18 * 4.4367834e-17 = -7.070096e+18
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11011000101000001011011101011000;
		b = 32'b00111010111011001011100010101110;
		correct = 32'b11011000101000001011011101011000;
		#400 //-1413674500000000.0 * 0.001806041 = -1413674500000000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10110001000011001100101010011001;
		b = 32'b00011001000101101001110111001011;
		correct = 32'b10110001000011001100101010011001;
		#400 //-2.0487845e-09 * 7.786684e-24 = -2.0487845e-09
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10001101001111110000100110101011;
		b = 32'b01001101010011111000001000000111;
		correct = 32'b11001101010011111000001000000111;
		#400 //-5.8868056e-31 * 217587820.0 = -217587820.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10000001001011011110011000111011;
		b = 32'b11000100000001010110101110100000;
		correct = 32'b01000100000001010110101110100000;
		#400 //-3.1940264e-38 * -533.68164 = 533.68164
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10111100010101110110001011000100;
		b = 32'b11000010110000100111000001000101;
		correct = 32'b01000010110000100110100110001010;
		#400 //-0.013146106 * -97.21928 = 97.20613
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11100010111000000010010110101010;
		b = 32'b10111100001001011101010011010100;
		correct = 32'b11100010111000000010010110101010;
		#400 //-2.0673923e+21 * -0.010121543 = -2.0673923e+21
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10011010100110111000010110101010;
		b = 32'b01001100101100110101000101100101;
		correct = 32'b11001100101100110101000101100101;
		#400 //-6.4322443e-23 * 94014250.0 = -94014250.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10101101100001000010100010011001;
		b = 32'b10110110011101001100111110010000;
		correct = 32'b00110110011101001100111101001110;
		#400 //-1.5024692e-11 * -3.647965e-06 = 3.64795e-06
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01111010111110011110001000100011;
		b = 32'b01100110011011010001001000111001;
		correct = 32'b01111010111110011110001000100011;
		#400 //6.4873426e+35 * 2.7988425e+23 = 6.4873426e+35
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00001001111011101011000001000010;
		b = 32'b01100111010111001101000011010011;
		correct = 32'b11100111010111001101000011010011;
		#400 //5.7462168e-33 * 1.04277275e+24 = -1.04277275e+24
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00101100111110011011011000011000;
		b = 32'b11100100010011001110110111001110;
		correct = 32'b01100100010011001110110111001110;
		#400 //7.097222e-12 * -1.5121086e+22 = 1.5121086e+22
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11100010100000011010110111101011;
		b = 32'b01110110001011000010101111011110;
		correct = 32'b11110110001011000010101111011110;
		#400 //-1.196081e+21 * 8.730125e+32 = -8.730125e+32
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11001110100110010000001100110010;
		b = 32'b00101100001001010011111100011001;
		correct = 32'b11001110100110010000001100110010;
		#400 //-1283561700.0 * 2.3482937e-12 = -1283561700.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01111100011011011010100001101011;
		b = 32'b00111100111010110101110010110010;
		correct = 32'b01111100011011011010100001101011;
		#400 //4.935961e+36 * 0.028730724 = 4.935961e+36
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10010010011001100001101000010101;
		b = 32'b00110110101101111000000010000000;
		correct = 32'b10110110101101111000000010000000;
		#400 //-7.260735e-28 * 5.4687844e-06 = -5.4687844e-06
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01010100010001111111010011001101;
		b = 32'b01110010110110000111111101110100;
		correct = 32'b11110010110110000111111101110100;
		#400 //3435222300000.0 * 8.576364e+30 = -8.576364e+30
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10011010011001110101110011101010;
		b = 32'b00110100111101001000101000011100;
		correct = 32'b10110100111101001000101000011100;
		#400 //-4.7844736e-23 * 4.554903e-07 = -4.554903e-07
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00010110010111011011001001001101;
		b = 32'b11110000100101000111010110001100;
		correct = 32'b01110000100101000111010110001100;
		#400 //1.79085e-25 * -3.675671e+29 = 3.675671e+29
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11011111001111111001001011100111;
		b = 32'b01110100011111111011101100111101;
		correct = 32'b11110100011111111011101100111101;
		#400 //-1.380435e+19 * 8.1044516e+31 = -8.1044516e+31
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01000100010001110100101110001001;
		b = 32'b11010111111011010001001110001110;
		correct = 32'b01010111111011010001001110001110;
		#400 //797.18024 * -521336500000000.0 = 521336500000000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11010110011000100100100100001100;
		b = 32'b11000100011010101100010110010011;
		correct = 32'b11010110011000100100100100001100;
		#400 //-62200840000000.0 * -939.0871 = -62200840000000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11110011100001000101001011010110;
		b = 32'b10110000000011010100111000001110;
		correct = 32'b11110011100001000101001011010110;
		#400 //-2.0967508e+31 * -5.1406424e-10 = -2.0967508e+31
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00000001001001010011111101111101;
		b = 32'b01100110110101011011110001110010;
		correct = 32'b11100110110101011011110001110010;
		#400 //3.0351264e-38 * 5.0467013e+23 = -5.0467013e+23
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10001111110101001110100110001011;
		b = 32'b00110010111001100110000100100101;
		correct = 32'b10110010111001100110000100100101;
		#400 //-2.0994771e-29 * 2.68197e-08 = -2.68197e-08
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11111001101101110101000100101100;
		b = 32'b00110010110000101110101111101001;
		correct = 32'b11111001101101110101000100101100;
		#400 //-1.1897959e+35 * 2.2691852e-08 = -1.1897959e+35
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10010111101011110100010001001100;
		b = 32'b00100010111001110101000110001010;
		correct = 32'b10100010111001110101000110001101;
		#400 //-1.132635e-24 * 6.269901e-18 = -6.269902e-18
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11100101001000011100001101110011;
		b = 32'b10110100010011100011001110101010;
		correct = 32'b11100101001000011100001101110011;
		#400 //-4.774415e+22 * -1.920404e-07 = -4.774415e+22
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00100011001011111011111011101000;
		b = 32'b10001110100010111010101001000111;
		correct = 32'b00100011001011111011111011101000;
		#400 //9.527195e-18 * -3.4430117e-30 = 9.527195e-18
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10011101111111010111110000001010;
		b = 32'b10011100001111011000010001010000;
		correct = 32'b10011101111001011100101110000000;
		#400 //-6.7096796e-21 * -6.2705864e-22 = -6.082621e-21
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10000000011011111101010010110110;
		b = 32'b00111101111101111111011010001110;
		correct = 32'b10111101111101111111011010001110;
		#400 //-1.0270046e-38 * 0.121075734 = -0.121075734
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11011111000000111001110010001010;
		b = 32'b00100111001101001010110100111010;
		correct = 32'b11011111000000111001110010001010;
		#400 //-9.483607e+18 * 2.5073924e-15 = -9.483607e+18
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00111010010101110010011110010110;
		b = 32'b01111000111000111011011010000011;
		correct = 32'b11111000111000111011011010000011;
		#400 //0.0008207498 * 3.6948536e+34 = -3.6948536e+34
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01110101011011110011100100010010;
		b = 32'b11010001000010110100011010001100;
		correct = 32'b01110101011011110011100100010010;
		#400 //3.032511e+32 * -37386502000.0 = 3.032511e+32
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11000110100111101011000100011011;
		b = 32'b00100100010010001000010011101111;
		correct = 32'b11000110100111101011000100011011;
		#400 //-20312.553 * 4.3480686e-17 = -20312.553
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01000101110100000110011010111110;
		b = 32'b11101100101011011100101000010100;
		correct = 32'b01101100101011011100101000010100;
		#400 //6668.843 * -1.6807876e+27 = 1.6807876e+27
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00010100110011111000000100010101;
		b = 32'b01110000100110011010111100010010;
		correct = 32'b11110000100110011010111100010010;
		#400 //2.0952572e-26 * 3.8050283e+29 = -3.8050283e+29
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00000011011011110101011101011101;
		b = 32'b10100101011101010110000011100011;
		correct = 32'b00100101011101010110000011100011;
		#400 //7.0336076e-37 * -2.1283189e-16 = 2.1283189e-16
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01010111110000101100001010000001;
		b = 32'b01001110110110111101001010101101;
		correct = 32'b01010111110000101100001001001010;
		#400 //428281300000000.0 * 1844008600.0 = 428279440000000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10011010000101011101100010100001;
		b = 32'b01101111011101111101011101011010;
		correct = 32'b11101111011101111101011101011010;
		#400 //-3.098747e-23 * 7.670314e+28 = -7.670314e+28
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10010000011000000000110100111100;
		b = 32'b00011011010111010011110000100011;
		correct = 32'b10011011010111010011110000100111;
		#400 //-4.4186406e-29 * 1.8300123e-22 = -1.8300128e-22
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01001000100100110110000111001101;
		b = 32'b10000101110001111010110111111100;
		correct = 32'b01001000100100110110000111001101;
		#400 //301838.4 * -1.8777782e-35 = 301838.4
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00011101110000110111111001100100;
		b = 32'b00110101001000101010101001101001;
		correct = 32'b10110101001000101010101001101001;
		#400 //5.1746755e-21 * 6.059768e-07 = -6.059768e-07
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00011011010111101011001010110110;
		b = 32'b10110111001010101000001101101101;
		correct = 32'b00110111001010101000001101101101;
		#400 //1.8421154e-22 * -1.016339e-05 = 1.016339e-05
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01010010111111000111010001100000;
		b = 32'b01001101111100011110100110100001;
		correct = 32'b01010010111111000011011111100110;
		#400 //542142100000.0 * 507327520.0 = 541634800000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01000010011101101000111110001000;
		b = 32'b10101111101100110110011010011010;
		correct = 32'b01000010011101101000111110001000;
		#400 //61.640167 * -3.2632813e-10 = 61.640167
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00010000100101011000001010001100;
		b = 32'b01111010001000000100100111000111;
		correct = 32'b11111010001000000100100111000111;
		#400 //5.8971277e-29 * 2.0806597e+35 = -2.0806597e+35
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11101001000111111011001011001000;
		b = 32'b01111000000111011010000101101001;
		correct = 32'b11111000000111011010000101101001;
		#400 //-1.2066467e+25 * 1.2788506e+34 = -1.2788506e+34
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11100110010010110001011111010000;
		b = 32'b11010011011001100110000101100101;
		correct = 32'b11100110010010110001011111010000;
		#400 //-2.3976991e+23 * -989476500000.0 = -2.3976991e+23
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10011010000100111110111111110001;
		b = 32'b00000000010101011001110100110000;
		correct = 32'b10011010000100111110111111110001;
		#400 //-3.059271e-23 * 7.862405e-39 = -3.059271e-23
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10101110000011101110110000101001;
		b = 32'b11111001110111100111101010111000;
		correct = 32'b01111001110111100111101010111000;
		#400 //-3.2496814e-11 * -1.4439737e+35 = 1.4439737e+35
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01100101101000100011101111001111;
		b = 32'b10000000000010110010011011000000;
		correct = 32'b01100101101000100011101111001111;
		#400 //9.576583e+22 * -1.024091e-39 = 9.576583e+22
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11100101001101100111011010000110;
		b = 32'b10001011110011000100110101010001;
		correct = 32'b11100101001101100111011010000110;
		#400 //-5.3853567e+22 * -7.8694275e-32 = -5.3853567e+22
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10111011011100110010011011000010;
		b = 32'b01011110010101011001110001011101;
		correct = 32'b11011110010101011001110001011101;
		#400 //-0.003710196 * 3.84807e+18 = -3.84807e+18
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01101100010001110011101110110110;
		b = 32'b01110010100010011000110011001100;
		correct = 32'b11110010100010011000011010010010;
		#400 //9.6343286e+26 * 5.4489164e+30 = -5.447953e+30
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00011010000000000001000111101101;
		b = 32'b11111101111101101111111110100000;
		correct = 32'b01111101111101101111111110100000;
		#400 //2.648426e-23 * -4.103967e+37 = 4.103967e+37
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00011100000000100101001110010011;
		b = 32'b01000000001010011001110111011101;
		correct = 32'b11000000001010011001110111011101;
		#400 //4.312141e-22 * 2.6502602 = -2.6502602
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00101100000101000010100000000001;
		b = 32'b10101101010000111001001011010110;
		correct = 32'b00101101011010001001110011010110;
		#400 //2.1054272e-12 * -1.1117071e-11 = 1.3222498e-11
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00101100010011000111100101111110;
		b = 32'b00101011111011101000111010111110;
		correct = 32'b00101011101010100110010000111110;
		#400 //2.9057585e-12 * 1.6950536e-12 = 1.2107049e-12
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10011100101010100001110011110100;
		b = 32'b01101101001110111010011010110101;
		correct = 32'b11101101001110111010011010110101;
		#400 //-1.1257141e-21 * 3.629702e+27 = -3.629702e+27
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00111101101011111101101100100110;
		b = 32'b00000011011101100001100011110001;
		correct = 32'b00111101101011111101101100100110;
		#400 //0.08586721 * 7.2321534e-37 = 0.08586721
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01010000000101001011101010011110;
		b = 32'b01011000101010110101100110110011;
		correct = 32'b11011000101010110101100101101001;
		#400 //9981032000.0 * 1507214000000000.0 = -1507204000000000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10011111001100101010011010100110;
		b = 32'b11100000001010000011101000101010;
		correct = 32'b01100000001010000011101000101010;
		#400 //-3.7830815e-20 * -4.848819e+19 = 4.848819e+19
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00011011111000011111010101001011;
		b = 32'b00100000100010110101111001001011;
		correct = 32'b10100000100010110010010111001110;
		#400 //3.7381644e-22 * 2.3609914e-19 = -2.3572533e-19
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10010111000111111100011000010110;
		b = 32'b11100011110101001000101000111010;
		correct = 32'b01100011110101001000101000111010;
		#400 //-5.162569e-25 * -7.84134e+21 = 7.84134e+21
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01100111111101001100011001000001;
		b = 32'b01111001000000001010100001101100;
		correct = 32'b11111001000000001010100001101100;
		#400 //2.3118291e+24 * 4.1751875e+34 = -4.1751875e+34
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10011010111001000110100010011101;
		b = 32'b00100100010001111111001101011111;
		correct = 32'b10100100010001111111001101111100;
		#400 //-9.44676e-23 * 4.335739e-17 = -4.3357486e-17
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10010001111011110111000110010110;
		b = 32'b11111001100001010010101011111100;
		correct = 32'b01111001100001010010101011111100;
		#400 //-3.7777554e-28 * -8.643091e+34 = 8.643091e+34
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00110011100001100110011000001000;
		b = 32'b01101001100000100001101110111111;
		correct = 32'b11101001100000100001101110111111;
		#400 //6.2584206e-08 * 1.9661423e+25 = -1.9661423e+25
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11010000111110000000000010011110;
		b = 32'b10101010100000101000000000101001;
		correct = 32'b11010000111110000000000010011110;
		#400 //-33286320000.0 * -2.3181568e-13 = -33286320000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10001010010100001111001100001111;
		b = 32'b01011001001011101100010001010100;
		correct = 32'b11011001001011101100010001010100;
		#400 //-1.006055e-32 * 3074532000000000.0 = -3074532000000000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00001001100100101010001010011100;
		b = 32'b10100000000000011001000111010100;
		correct = 32'b00100000000000011001000111010100;
		#400 //3.530114e-33 * -1.0974975e-19 = 1.0974975e-19
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01001111100010111011111100101100;
		b = 32'b11000101010111100111101111110011;
		correct = 32'b01001111100010111011111100110011;
		#400 //4689123300.0 * -3559.7468 = 4689127000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10011001000011111001000011001111;
		b = 32'b00110010100011100111111101011000;
		correct = 32'b10110010100011100111111101011000;
		#400 //-7.4221706e-24 * 1.6588885e-08 = -1.6588885e-08
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10011101000000100011100011000001;
		b = 32'b01000101101001010101001110011001;
		correct = 32'b11000101101001010101001110011001;
		#400 //-1.7234698e-21 * 5290.4497 = -5290.4497
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11101010000110000101011101100100;
		b = 32'b01001110000101100011110010101101;
		correct = 32'b11101010000110000101011101100100;
		#400 //-4.6042354e+25 * 630139700.0 = -4.6042354e+25
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01010010001010111101100010100101;
		b = 32'b01100010110101001010111000100000;
		correct = 32'b11100010110101001010111000100000;
		#400 //184518520000.0 * 1.9616284e+21 = -1.9616284e+21
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00011111011000000001111000011100;
		b = 32'b00010100010111011011110101100010;
		correct = 32'b00011111011000000001111000011001;
		#400 //4.745875e-20 * 1.1194998e-26 = 4.745874e-20
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01001000000111000011011110100110;
		b = 32'b11010111101000000000001010000011;
		correct = 32'b01010111101000000000001010000011;
		#400 //159966.6 * -351865300000000.0 = 351865300000000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10100101101001000011000001001110;
		b = 32'b00011011011001110000101101010011;
		correct = 32'b10100101101001000011000001010101;
		#400 //-2.8482198e-16 * 1.9111531e-22 = -2.8482216e-16
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11100000011100101001001001100110;
		b = 32'b00011111101011110010010110101001;
		correct = 32'b11100000011100101001001001100110;
		#400 //-6.991658e+19 * 7.4177686e-20 = -6.991658e+19
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10000110101111100110100101000101;
		b = 32'b10000111011101101100100010111011;
		correct = 32'b00000111000101111001010000011000;
		#400 //-7.1624736e-35 * -1.8565972e-34 = 1.1403498e-34
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00001110001110011000111001010000;
		b = 32'b00011000100111100110101000110111;
		correct = 32'b10011000100111100110101000110001;
		#400 //2.2871532e-30 * 4.0949292e-24 = -4.094927e-24
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00001101000000100100100000000001;
		b = 32'b01010001111011100100111110010111;
		correct = 32'b11010001111011100100111110010111;
		#400 //4.0146014e-31 * 127942190000.0 = -127942190000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00111001000000011111010010010001;
		b = 32'b11001000011110010011001000000000;
		correct = 32'b01001000011110010011001000000000;
		#400 //0.00012393507 * -255176.0 = 255176.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00100011101110110111000100001111;
		b = 32'b11101010010100001001010111001010;
		correct = 32'b01101010010100001001010111001010;
		#400 //2.0322463e-17 * -6.3040982e+25 = 6.3040982e+25
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00101110100101000100100000111000;
		b = 32'b11011010010000100100101010001100;
		correct = 32'b01011010010000100100101010001100;
		#400 //6.7430894e-11 * -1.3672028e+16 = 1.3672028e+16
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11000110011010000010111001100000;
		b = 32'b00000101001001000001001111011110;
		correct = 32'b11000110011010000010111001100000;
		#400 //-14859.594 * 7.714892e-36 = -14859.594
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01000011110100010011101010011010;
		b = 32'b11000111001101111110100000010100;
		correct = 32'b01000111001110011000101010001001;
		#400 //418.45782 * -47080.08 = 47498.535
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10110110001011110100000000100001;
		b = 32'b10111101100111010000010111100000;
		correct = 32'b00111101100111010000010010000001;
		#400 //-2.611436e-06 * -0.07667136 = 0.07666875
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11101010010001111001010000110000;
		b = 32'b11100111111011000011100000101101;
		correct = 32'b11101010010000000011001001101111;
		#400 //-6.031901e+25 * -2.2310295e+24 = -5.808798e+25
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11010000010101111001111110111001;
		b = 32'b11111011010000001001010111001001;
		correct = 32'b01111011010000001001010111001001;
		#400 //-14470276000.0 * -9.99959e+35 = 9.99959e+35
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01111010001010001010111011011010;
		b = 32'b10000101100011100010110110110110;
		correct = 32'b01111010001010001010111011011010;
		#400 //2.1896307e+35 * -1.3370407e-35 = 2.1896307e+35
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10010010111101001101000100111011;
		b = 32'b11100001100000100000010010100110;
		correct = 32'b01100001100000100000010010100110;
		#400 //-1.5450144e-27 * -2.9980146e+20 = 2.9980146e+20
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01000110100101000110010011111111;
		b = 32'b11101100010101000010111111001000;
		correct = 32'b01101100010101000010111111001000;
		#400 //18994.498 * -1.02607166e+27 = 1.02607166e+27
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00101100100100000101100101101011;
		b = 32'b11000001010100100101111101000110;
		correct = 32'b01000001010100100101111101000110;
		#400 //4.1026535e-12 * -13.14826 = 13.14826
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00000111101010111111011010011011;
		b = 32'b01101110100000100010000000001111;
		correct = 32'b11101110100000100010000000001111;
		#400 //2.5874162e-34 * 2.0135904e+28 = -2.0135904e+28
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11110110001000000011110101110101;
		b = 32'b10011110011110111010010111100000;
		correct = 32'b11110110001000000011110101110101;
		#400 //-8.125137e+32 * -1.33221315e-20 = -8.125137e+32
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00010001011101010111101100010100;
		b = 32'b00000101111110100100110101101001;
		correct = 32'b00010001011101010111101100010010;
		#400 //1.9365019e-28 * 2.3538323e-35 = 1.9365016e-28
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11101110010010001011010111011110;
		b = 32'b00110100111001111101001101101101;
		correct = 32'b11101110010010001011010111011110;
		#400 //-1.5529216e+28 * 4.3180935e-07 = -1.5529216e+28
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10100111000110111100111110001101;
		b = 32'b11101011000011010100001001110110;
		correct = 32'b01101011000011010100001001110110;
		#400 //-2.1623085e-15 * -1.707724e+26 = 1.707724e+26
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01100101111110100010000100011110;
		b = 32'b00100011101100101100010011100001;
		correct = 32'b01100101111110100010000100011110;
		#400 //1.4765032e+23 * 1.938218e-17 = 1.4765032e+23
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01000001101100000010100001110110;
		b = 32'b00111111100110011000010111000011;
		correct = 32'b01000001101001101001000000011010;
		#400 //22.019756 * 1.1993946 = 20.820362
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00111111110011011111010000011100;
		b = 32'b11000100100101111100011010001101;
		correct = 32'b01000100100101111111101000001010;
		#400 //1.6090121 * -1214.2047 = 1215.8137
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11100011011011000101000011101000;
		b = 32'b10001001010011010010000111111111;
		correct = 32'b11100011011011000101000011101000;
		#400 //-4.3592615e+21 * -2.4691962e-33 = -4.3592615e+21
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00111011100110000000111101000110;
		b = 32'b01011100110100111101100111111100;
		correct = 32'b11011100110100111101100111111100;
		#400 //0.0046404926 * 4.7704717e+17 = -4.7704717e+17
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11101110100010100101011111011100;
		b = 32'b01000100000000011111100101100011;
		correct = 32'b11101110100010100101011111011100;
		#400 //-2.1407573e+28 * 519.89667 = -2.1407573e+28
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01001111100101100011001110011111;
		b = 32'b00110001110000110011111000011000;
		correct = 32'b01001111100101100011001110011111;
		#400 //5039931000.0 * 5.682306e-09 = 5039931000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00111111110010010110011101110111;
		b = 32'b10110101100110100011101011110010;
		correct = 32'b00111111110010010110011110000001;
		#400 //1.57347 * -1.149105e-06 = 1.5734712
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10000000110000001100101011100101;
		b = 32'b01001011110001011110011011001100;
		correct = 32'b11001011110001011110011011001100;
		#400 //-1.77052e-38 * 25939352.0 = -25939352.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01110010101001010110110111010000;
		b = 32'b01010101111000111010101110011011;
		correct = 32'b01110010101001010110110111010000;
		#400 //6.553316e+30 * 31290772000000.0 = 6.553316e+30
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10000110010101000010111100111001;
		b = 32'b00010000010100110111011010000110;
		correct = 32'b10010000010100110111011010010011;
		#400 //-3.9907462e-35 * 4.170372e-29 = -4.170376e-29
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01101010110001000011110101111110;
		b = 32'b00000110011101111101011100111001;
		correct = 32'b01101010110001000011110101111110;
		#400 //1.18619925e+26 * 4.6613657e-35 = 1.18619925e+26
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11101011111011001000010010100010;
		b = 32'b01101111100010011110010110111111;
		correct = 32'b11101111100010101101001001000100;
		#400 //-5.7186567e+26 * 8.535438e+28 = -8.592625e+28
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01100010100111111101001100010001;
		b = 32'b11000100101111110000011011101101;
		correct = 32'b01100010100111111101001100010001;
		#400 //1.4741206e+21 * -1528.2164 = 1.4741206e+21
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01110101101111011001011110010100;
		b = 32'b01001101110000110010101001110101;
		correct = 32'b01110101101111011001011110010100;
		#400 //4.806731e+32 * 409292450.0 = 4.806731e+32
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11111101001000010100010101100000;
		b = 32'b10110000111001101111101000100011;
		correct = 32'b11111101001000010100010101100000;
		#400 //-1.339787e+37 * -1.6805796e-09 = -1.339787e+37
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00110111111001111011000111010101;
		b = 32'b01000100100111001110001110001011;
		correct = 32'b11000100100111001110001110001011;
		#400 //2.7620155e-05 * 1255.1107 = -1255.1107
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11100100011010110100010100011001;
		b = 32'b11101101101011001000001001001111;
		correct = 32'b01101101101011001000001000110010;
		#400 //-1.7359855e+22 * -6.6736194e+27 = 6.673602e+27
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01000011001010100000111110001011;
		b = 32'b11010011110011100011011000011101;
		correct = 32'b01010011110011100011011000011101;
		#400 //170.06071 * -1771342300000.0 = 1771342300000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00011001011111111111101000100111;
		b = 32'b01110100110011011001111001100100;
		correct = 32'b11110100110011011001111001100100;
		#400 //1.3233709e-23 * 1.3032634e+32 = -1.3032634e+32
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01101101110010100011010100101110;
		b = 32'b10100101111111010001110000001101;
		correct = 32'b01101101110010100011010100101110;
		#400 //7.822533e+27 * -4.3907512e-16 = 7.822533e+27
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00101001001011001000110111101000;
		b = 32'b10000110000111100100001010000010;
		correct = 32'b00101001001011001000110111101000;
		#400 //3.8314756e-14 * -2.976536e-35 = 3.8314756e-14
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01111101001001011110010000001010;
		b = 32'b11001010111010000110111110110001;
		correct = 32'b01111101001001011110010000001010;
		#400 //1.3781667e+37 * -7616472.5 = 1.3781667e+37
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11010110110100111101001110100000;
		b = 32'b10111001110111110100100000111011;
		correct = 32'b11010110110100111101001110100000;
		#400 //-116452940000000.0 * -0.0004258769 = -116452940000000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11011011110100101001110100001011;
		b = 32'b01000101101000010010111111100111;
		correct = 32'b11011011110100101001110100001011;
		#400 //-1.1856483e+17 * 5157.988 = -1.1856483e+17
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01000101110110011110000011011111;
		b = 32'b10010000001000010000000111111111;
		correct = 32'b01000101110110011110000011011111;
		#400 //6972.109 * -3.175319e-29 = 6972.109
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10011111000100011001010110001010;
		b = 32'b11001011110000010001111101000001;
		correct = 32'b01001011110000010001111101000001;
		#400 //-3.082864e-20 * -25312898.0 = 25312898.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10010011101100100010011011110011;
		b = 32'b00101111100000111100101000011011;
		correct = 32'b10101111100000111100101000011011;
		#400 //-4.4971924e-27 * 2.3972366e-10 = -2.3972366e-10
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00111010100010111011101001011110;
		b = 32'b01110001011110100101000101010100;
		correct = 32'b11110001011110100101000101010100;
		#400 //0.00106604 * 1.23951315e+30 = -1.23951315e+30
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00110001111001111111001011001101;
		b = 32'b10101010000010000001010011100011;
		correct = 32'b00110001111001111111001111011101;
		#400 //6.750588e-09 * -1.2086473e-13 = 6.750709e-09
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10011111011111011110111001100010;
		b = 32'b00000100010001110111001100000101;
		correct = 32'b10011111011111011110111001100010;
		#400 //-5.377202e-20 * 2.3445152e-36 = -5.377202e-20
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11101011010001100110110000010010;
		b = 32'b10000110110011000001010010010100;
		correct = 32'b11101011010001100110110000010010;
		#400 //-2.3987766e+26 * -7.676651e-35 = -2.3987766e+26
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10011000011001111010110111011010;
		b = 32'b01010001000101011010101010111011;
		correct = 32'b11010001000101011010101010111011;
		#400 //-2.9943823e-24 * 40175907000.0 = -40175907000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11000101000110011110111001100100;
		b = 32'b00100000100100110110010000010011;
		correct = 32'b11000101000110011110111001100100;
		#400 //-2462.8994 * 2.4968992e-19 = -2462.8994
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01101110000101110011101000011100;
		b = 32'b00101001000100111001000001001011;
		correct = 32'b01101110000101110011101000011100;
		#400 //1.1700622e+28 * 3.276571e-14 = 1.1700622e+28
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11111001100101100101001011011100;
		b = 32'b01011100000111010110010010100111;
		correct = 32'b11111001100101100101001011011100;
		#400 //-9.756564e+34 * 1.7720896e+17 = -9.756564e+34
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00011011001000000001100111110110;
		b = 32'b00010001000001011111110101100110;
		correct = 32'b00011011001000000001100111101110;
		#400 //1.3243278e-22 * 1.0569934e-28 = 1.3243268e-22
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01001000110100011101000010100100;
		b = 32'b11010000000010010100001010011100;
		correct = 32'b01010000000010010100010001000000;
		#400 //429701.12 * -9211376000.0 = 9211806000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00011110110111010101000101000101;
		b = 32'b11101011110101110011010010010001;
		correct = 32'b01101011110101110011010010010001;
		#400 //2.3432897e-20 * -5.2033458e+26 = 5.2033458e+26
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11000001100101100101000110011111;
		b = 32'b10010000010100111000010000001011;
		correct = 32'b11000001100101100101000110011111;
		#400 //-18.789854 * -4.1714135e-29 = -18.789854
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10100010101011111111000011110101;
		b = 32'b00010110110011010101111000010100;
		correct = 32'b10100010101011111111000011110110;
		#400 //-4.768897e-18 * 3.3178908e-25 = -4.7688972e-18
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11111010110010111001101100110001;
		b = 32'b11001000000001001111100111101110;
		correct = 32'b11111010110010111001101100110001;
		#400 //-5.2859196e+35 * -136167.72 = -5.2859196e+35
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00100101101001000101111111111110;
		b = 32'b10001000101101011001001011111001;
		correct = 32'b00100101101001000101111111111110;
		#400 //2.8514512e-16 * -1.0928094e-33 = 2.8514512e-16
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10011100010111100111101100111111;
		b = 32'b01100111001001001100100100111010;
		correct = 32'b11100111001001001100100100111010;
		#400 //-7.361293e-22 * 7.781801e+23 = -7.781801e+23
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00100000001010100010001100101111;
		b = 32'b01100111111010111010011101001101;
		correct = 32'b11100111111010111010011101001101;
		#400 //1.4411201e-19 * 2.2256846e+24 = -2.2256846e+24
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00101100101111010111100110111110;
		b = 32'b01111111001110001110100110110101;
		correct = 32'b11111111001110001110100110110101;
		#400 //5.385219e-12 * 2.4579143e+38 = -2.4579143e+38
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10001011001111001101000110101000;
		b = 32'b11110000010001001000010011000100;
		correct = 32'b01110000010001001000010011000100;
		#400 //-3.636521e-32 * -2.4327826e+29 = 2.4327826e+29
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11111001100001110110101111010110;
		b = 32'b00000000011001101111110100110001;
		correct = 32'b11111001100001110110101111010110;
		#400 //-8.789341e+34 * 9.458049e-39 = -8.789341e+34
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00100110000001011011010111110001;
		b = 32'b01101010111101110010011000010000;
		correct = 32'b11101010111101110010011000010000;
		#400 //4.639022e-16 * 1.4939221e+26 = -1.4939221e+26
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10000000010011101001101110000011;
		b = 32'b11100011111111011111101001111111;
		correct = 32'b01100011111111011111101001111111;
		#400 //-7.218956e-39 * -9.370153e+21 = 9.370153e+21
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00011010111111011101000111100111;
		b = 32'b00101001101010010011110110010101;
		correct = 32'b10101001101010010011110110010101;
		#400 //1.0497746e-22 * 7.5157904e-14 = -7.5157904e-14
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11110101111111101110010010110100;
		b = 32'b11010011001101000001101010111000;
		correct = 32'b11110101111111101110010010110100;
		#400 //-6.4623147e+32 * -773542400000.0 = -6.4623147e+32
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01001011101001101100111110100101;
		b = 32'b10101000111001000111000011010100;
		correct = 32'b01001011101001101100111110100101;
		#400 //21864266.0 * -2.5362016e-14 = 21864266.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11100100000011000110110000100101;
		b = 32'b01011100011010001000100101101110;
		correct = 32'b11100100000011000110110100001110;
		#400 //-1.0361347e+22 * 2.618132e+17 = -1.036161e+22
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00100000110110001010111101010001;
		b = 32'b11100010111001100111101100001011;
		correct = 32'b01100010111001100111101100001011;
		#400 //3.6707838e-19 * -2.1258087e+21 = 2.1258087e+21
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11100111001000000100011100010011;
		b = 32'b01010000110110110001101011110011;
		correct = 32'b11100111001000000100011100010011;
		#400 //-7.568897e+23 * 29407812000.0 = -7.568897e+23
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10111101101000011111010001111011;
		b = 32'b01011110011010110001101111111010;
		correct = 32'b11011110011010110001101111111010;
		#400 //-0.07907959 * 4.2353523e+18 = -4.2353523e+18
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11001001000100110000111111101010;
		b = 32'b00110101101110001001110110111101;
		correct = 32'b11001001000100110000111111101010;
		#400 //-602366.6 * 1.3754976e-06 = -602366.6
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01011100111010011000001010001000;
		b = 32'b10101110001011101011011000000001;
		correct = 32'b01011100111010011000001010001000;
		#400 //5.2581752e+17 * -3.972467e-11 = 5.2581752e+17
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11001101100100110001011001010001;
		b = 32'b01111101001110010010011010110110;
		correct = 32'b11111101001110010010011010110110;
		#400 //-308464160.0 * 1.5381761e+37 = -1.5381761e+37
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10110110010001011110010001000101;
		b = 32'b10000110000111010010001111011000;
		correct = 32'b10110110010001011110010001000101;
		#400 //-2.9488158e-06 * -2.9554752e-35 = -2.9488158e-06
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11111100100111001000110011010111;
		b = 32'b00010101110010001110000001001110;
		correct = 32'b11111100100111001000110011010111;
		#400 //-6.502839e+36 * 8.113325e-26 = -6.502839e+36
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11010100001010100110100001001011;
		b = 32'b01110000110011011101000010001100;
		correct = 32'b11110000110011011101000010001100;
		#400 //-2927576700000.0 * 5.0957236e+29 = -5.0957236e+29
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00001111001000110111110000010101;
		b = 32'b00111111100110101110111100011000;
		correct = 32'b10111111100110101110111100011000;
		#400 //8.060418e-30 * 1.2104216 = -1.2104216
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11101101101011000010001101100010;
		b = 32'b01001111000101101001001010100101;
		correct = 32'b11101101101011000010001101100010;
		#400 //-6.6592746e+27 * 2526193000.0 = -6.6592746e+27
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00001011001000010010100100110111;
		b = 32'b11100110000011011001011010011110;
		correct = 32'b01100110000011011001011010011110;
		#400 //3.103848e-32 * -1.6715802e+23 = 1.6715802e+23
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01100100010110100111101101110010;
		b = 32'b11100101010111100000100101010001;
		correct = 32'b01100101100010100101010000010111;
		#400 //1.6121142e+22 * -6.5533576e+22 = 8.165472e+22
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11110011001001001110010101011110;
		b = 32'b10101000111110010111100011010100;
		correct = 32'b11110011001001001110010101011110;
		#400 //-1.3064404e+31 * -2.7696954e-14 = -1.3064404e+31
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00001010110100110100111100101000;
		b = 32'b11001101010010100100001100100000;
		correct = 32'b01001101010010100100001100100000;
		#400 //2.0348336e-32 * -212087300.0 = 212087300.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11011010010101011100011011100001;
		b = 32'b11110000111011000011001010001101;
		correct = 32'b01110000111011000011001010001101;
		#400 //-1.504321e+16 * -5.847966e+29 = 5.847966e+29
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01011101000110001000000000000011;
		b = 32'b10111010000100110100101000101101;
		correct = 32'b01011101000110001000000000000011;
		#400 //6.8679915e+17 * -0.0005618658 = 6.8679915e+17
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11010001001111100101010101111110;
		b = 32'b00111100000001011111101001010101;
		correct = 32'b11010001001111100101010101111110;
		#400 //-51092380000.0 * 0.00817736 = -51092380000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10011101000001010110111111011100;
		b = 32'b00001011001001010010111011000000;
		correct = 32'b10011101000001010110111111011100;
		#400 //-1.7660233e-21 * 3.1813015e-32 = -1.7660233e-21
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01010000000111101011111100101111;
		b = 32'b00110000001111101000000001100001;
		correct = 32'b01010000000111101011111100101111;
		#400 //10653318000.0 * 6.9304035e-10 = 10653318000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00011001010001010110100111010111;
		b = 32'b11001100001111011010001011000010;
		correct = 32'b01001100001111011010001011000010;
		#400 //1.02060355e-23 * -49711880.0 = 49711880.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11110101111100100100011100000000;
		b = 32'b00111100100010000010010111011011;
		correct = 32'b11110101111100100100011100000000;
		#400 //-6.1424604e+32 * 0.016619613 = -6.1424604e+32
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11001100101011001110001001110101;
		b = 32'b10100011000010010001100000000010;
		correct = 32'b11001100101011001110001001110101;
		#400 //-90641320.0 * -7.431869e-18 = -90641320.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10100011011100111011111011111001;
		b = 32'b10000000000011000011101001101101;
		correct = 32'b10100011011100111011111011111001;
		#400 //-1.32134964e-17 * -1.122985e-39 = -1.32134964e-17
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01000100010110111001011110010110;
		b = 32'b00001100111000101001011111010111;
		correct = 32'b01000100010110111001011110010110;
		#400 //878.3685 * 3.4912199e-31 = 878.3685
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00110001010101001111101010110011;
		b = 32'b01100111110010001010011011010101;
		correct = 32'b11100111110010001010011011010101;
		#400 //3.0992566e-09 * 1.8951016e+24 = -1.8951016e+24
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11100111010111000100010101000000;
		b = 32'b01010111010101101001010111000111;
		correct = 32'b11100111010111000100010101000000;
		#400 //-1.04019806e+24 * 235938780000000.0 = -1.04019806e+24
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01101110001101101110111101011101;
		b = 32'b10010111111010100001010000101010;
		correct = 32'b01101110001101101110111101011101;
		#400 //1.4153911e+28 * -1.5126986e-24 = 1.4153911e+28
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11011111110010011001101010101110;
		b = 32'b01100100101101001011011000111100;
		correct = 32'b11100100101101001110100010100011;
		#400 //-2.905423e+19 * 2.6668362e+22 = -2.6697417e+22
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11011000101000000010011111001111;
		b = 32'b01110111010001100111001100111011;
		correct = 32'b11110111010001100111001100111011;
		#400 //-1408742700000000.0 * 4.0250466e+33 = -4.0250466e+33
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10101111011110010010000001110010;
		b = 32'b10011110001011011110010010100111;
		correct = 32'b10101111011110010010000001110010;
		#400 //-2.2657945e-10 * -9.205828e-21 = -2.2657945e-10
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01101001101000000011110011110000;
		b = 32'b11010000111010101010010011011101;
		correct = 32'b01101001101000000011110011110000;
		#400 //2.4214488e+25 * -31493384000.0 = 2.4214488e+25
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00011011010111000101011100111111;
		b = 32'b01000010001101111010011110110110;
		correct = 32'b11000010001101111010011110110110;
		#400 //1.8226164e-22 * 45.91378 = -45.91378
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01010110000100100011110100100110;
		b = 32'b01010100100010101110001110000101;
		correct = 32'b01010110000000001110000010110101;
		#400 //40197830000000.0 * 4772181000000.0 = 35425650000000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10111110011110010011011101010000;
		b = 32'b10111110000011111100110101000110;
		correct = 32'b10111101110100101101010000010100;
		#400 //-0.24337506 * -0.1404315 = -0.10294357
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00101100100011110111011100001010;
		b = 32'b11100001011100101100000111000011;
		correct = 32'b01100001011100101100000111000011;
		#400 //4.0775204e-12 * -2.7987963e+20 = 2.7987963e+20
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01111000000011111100111111100001;
		b = 32'b00110111001000001111010000000000;
		correct = 32'b01111000000011111100111111100001;
		#400 //1.1667418e+34 * 9.593554e-06 = 1.1667418e+34
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11110100000110101101000010001100;
		b = 32'b11001010100001011101001100011011;
		correct = 32'b11110100000110101101000010001100;
		#400 //-4.9062717e+31 * -4385165.5 = -4.9062717e+31
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11111110100010000010001000010001;
		b = 32'b01110011011010100110110011111110;
		correct = 32'b11111110100010000010001000010011;
		#400 //-9.047595e+37 * 1.8573121e+31 = -9.047597e+37
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01111000110000110011101101000101;
		b = 32'b11010110110110110001110011110110;
		correct = 32'b01111000110000110011101101000101;
		#400 //3.1678126e+34 * -120458720000000.0 = 3.1678126e+34
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00111110010011000100100101010100;
		b = 32'b01011100101010110011011110110100;
		correct = 32'b11011100101010110011011110110100;
		#400 //0.19949847 * 3.8554774e+17 = -3.8554774e+17
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00011001110011100010000000011000;
		b = 32'b10101101100101010001100100001101;
		correct = 32'b00101101100101010001100100001101;
		#400 //2.1312863e-23 * -1.6950464e-11 = 1.6950464e-11
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01010100110111100101110001100000;
		b = 32'b01101111100001010111011100000000;
		correct = 32'b11101111100001010111011100000000;
		#400 //7640260300000.0 * 8.261074e+28 = -8.261074e+28
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01110110010101110011011000110000;
		b = 32'b11010101111110111100011111100001;
		correct = 32'b01110110010101110011011000110000;
		#400 //1.0912528e+33 * -34604486000000.0 = 1.0912528e+33
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00111011011011001111111011001010;
		b = 32'b11100100111001101100000101110010;
		correct = 32'b01100100111001101100000101110010;
		#400 //0.0036162608 * -3.4053523e+22 = 3.4053523e+22
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11101010100101000011101111100011;
		b = 32'b01111010011100100010111010101100;
		correct = 32'b11111010011100100010111010101100;
		#400 //-8.960191e+25 * 3.1437061e+35 = -3.1437061e+35
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01001110010010010111100010010100;
		b = 32'b01011101000001101100010111000010;
		correct = 32'b11011101000001101100010111000010;
		#400 //845030660.0 * 6.0696134e+17 = -6.0696134e+17
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00001100010110111011101000001110;
		b = 32'b01011001110100110010111100000101;
		correct = 32'b11011001110100110010111100000101;
		#400 //1.6927135e-31 * 7430365000000000.0 = -7430365000000000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11101111011000101010011111100001;
		b = 32'b00111101001000010010111000101001;
		correct = 32'b11101111011000101010011111100001;
		#400 //-7.0146565e+28 * 0.039350662 = -7.0146565e+28
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01010011011011110010000100110101;
		b = 32'b10100100100110101111100101101000;
		correct = 32'b01010011011011110010000100110101;
		#400 //1027054300000.0 * -6.7209364e-17 = 1027054300000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10110011000100011101011010000001;
		b = 32'b10000001011101001000110011110100;
		correct = 32'b10110011000100011101011010000001;
		#400 //-3.3955533e-08 * -4.491685e-38 = -3.3955533e-08
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00101011001001011101010101000111;
		b = 32'b11001110100011111001011011101011;
		correct = 32'b01001110100011111001011011101011;
		#400 //5.891576e-13 * -1204516200.0 = 1204516200.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00110101000010010111110011011110;
		b = 32'b10010110110001100111001000100110;
		correct = 32'b00110101000010010111110011011110;
		#400 //5.121818e-07 * -3.2060663e-25 = 5.121818e-07
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00011001110001110010100011011000;
		b = 32'b00001010100110110001110111010111;
		correct = 32'b00011001110001110010100011011000;
		#400 //2.0592614e-23 * 1.4937182e-32 = 2.0592614e-23
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11111110011011010111100110010011;
		b = 32'b10000000100010011000001110001100;
		correct = 32'b11111110011011010111100110010011;
		#400 //-7.891457e+37 * -1.2628653e-38 = -7.891457e+37
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01011001011110101001000001000000;
		b = 32'b01000101010110111010110110011111;
		correct = 32'b01011001011110101001000001000000;
		#400 //4407959300000000.0 * 3514.8513 = 4407959300000000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10001011111110101001100111111110;
		b = 32'b10101010100000000101110010110111;
		correct = 32'b00101010100000000101110010110111;
		#400 //-9.65282e-32 * -2.2801701e-13 = 2.2801701e-13
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00110000111101011110000011001000;
		b = 32'b10111101100000000010000010000011;
		correct = 32'b00111101100000000010000010000011;
		#400 //1.7889983e-09 * -0.06256201 = 0.06256201
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10011100011100111100111011010010;
		b = 32'b00111010000111010110111111010111;
		correct = 32'b10111010000111010110111111010111;
		#400 //-8.0669265e-22 * 0.000600574 = -0.000600574
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11100011110101001000100100011001;
		b = 32'b01100110010000011000100000000000;
		correct = 32'b11100110010010000010110001001001;
		#400 //-7.8411773e+21 * 2.2848137e+23 = -2.3632255e+23
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10010010110101011111101100111111;
		b = 32'b11101001110011101001110100111110;
		correct = 32'b01101001110011101001110100111110;
		#400 //-1.3504127e-27 * -3.122266e+25 = 3.122266e+25
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11001001101110001101100001100111;
		b = 32'b10111110100110100011001000000100;
		correct = 32'b11001001101110001101100001100101;
		#400 //-1514252.9 * -0.30116284 = -1514252.6
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01000101101111001101110111010010;
		b = 32'b11000100010111000011010000000011;
		correct = 32'b01000101110110000110010001010010;
		#400 //6043.7275 * -880.8127 = 6924.54
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00101001010000101010000001111001;
		b = 32'b10001111010101101011111011110001;
		correct = 32'b00101001010000101010000001111001;
		#400 //4.321584e-14 * -1.05877886e-29 = 4.321584e-14
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11011110111001011111110101010000;
		b = 32'b10000011100100101111001111000101;
		correct = 32'b11011110111001011111110101010000;
		#400 //-8.286245e+18 * -8.6370755e-37 = -8.286245e+18
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11000001011010000011100010000000;
		b = 32'b00010001000010110111010101011000;
		correct = 32'b11000001011010000011100010000000;
		#400 //-14.513794 * 1.1001326e-28 = -14.513794
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11010001011001010101011010001000;
		b = 32'b00101101000001101001000100111101;
		correct = 32'b11010001011001010101011010001000;
		#400 //-61562454000.0 * 7.6492675e-12 = -61562454000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10110010110110001000001101001000;
		b = 32'b01000000011000101011111100100100;
		correct = 32'b11000000011000101011111100100100;
		#400 //-2.520541e-08 * 3.5429163 = -3.5429163
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11111000000000000001100000101111;
		b = 32'b10010000000111111000101101001011;
		correct = 32'b11111000000000000001100000101111;
		#400 //-1.0392258e+34 * -3.1464528e-29 = -1.0392258e+34
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00011011101110010101001100010100;
		b = 32'b10100110010100001110111000100011;
		correct = 32'b00100110010100001110111000101001;
		#400 //3.065937e-22 * -7.248723e-16 = 7.2487264e-16
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11101101100100000110011100010001;
		b = 32'b00001010110001111111100101010101;
		correct = 32'b11101101100100000110011100010001;
		#400 //-5.586305e+27 * 1.9256791e-32 = -5.586305e+27
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01100100111011110011011010010100;
		b = 32'b01010111001110000010100001110110;
		correct = 32'b01100100111011110011011010010100;
		#400 //3.5301637e+22 * 202483920000000.0 = 3.5301637e+22
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01001001110001110011010011001100;
		b = 32'b11011000001011101111011100101010;
		correct = 32'b01011000001011101111011100101010;
		#400 //1631897.5 * -769506340000000.0 = 769506340000000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01100010100111110101110100001010;
		b = 32'b10011110010010101000001101101100;
		correct = 32'b01100010100111110101110100001010;
		#400 //1.4698682e+21 * -1.0720968e-20 = 1.4698682e+21
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00110011100110110100010100011111;
		b = 32'b01111101001101110101101010100111;
		correct = 32'b11111101001101110101101010100111;
		#400 //7.230323e-08 * 1.5232464e+37 = -1.5232464e+37
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00111110001100110111101110110101;
		b = 32'b00111011110011010011101000100011;
		correct = 32'b00111110001011010001000111100100;
		#400 //0.17527659 * 0.006263034 = 0.16901356
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01001100100010111101010110011011;
		b = 32'b11101101001011001010010111110001;
		correct = 32'b01101101001011001010010111110001;
		#400 //73313496.0 * -3.339502e+27 = 3.339502e+27
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10010010001001110101000111110111;
		b = 32'b00111001011010011011111110111011;
		correct = 32'b10111001011010011011111110111011;
		#400 //-5.279694e-28 * 0.00022292037 = -0.00022292037
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00101001101000001000010101100100;
		b = 32'b10111100000001110010000001001000;
		correct = 32'b00111100000001110010000001001000;
		#400 //7.128567e-14 * -0.008247443 = 0.008247443
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01000101000111100011111100101111;
		b = 32'b10010100010000100010100110110111;
		correct = 32'b01000101000111100011111100101111;
		#400 //2531.949 * -9.802724e-27 = 2531.949
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10111000110110110101110000110001;
		b = 32'b10110100000101111001110000111001;
		correct = 32'b10111000110110110001000001100011;
		#400 //-0.00010459906 * -1.4119804e-07 = -0.00010445786
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01000111011101111101000010010111;
		b = 32'b00111001111010011111010100110100;
		correct = 32'b01000111011101111101000010010111;
		#400 //63440.59 * 0.00044623914 = 63440.59
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01110111101101001001000110010110;
		b = 32'b01100111011000100111100011111010;
		correct = 32'b01110111101101001001000110010110;
		#400 //7.3247365e+33 * 1.06948645e+24 = 7.3247365e+33
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01111111011111100100001101011110;
		b = 32'b00011001101111101110111010000100;
		correct = 32'b01111111011111100100001101011110;
		#400 //3.379737e+38 * 1.9741875e-23 = 3.379737e+38
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11100100101110101101011011000100;
		b = 32'b00100111101101010101101001010101;
		correct = 32'b11100100101110101101011011000100;
		#400 //-2.757256e+22 * 5.033553e-15 = -2.757256e+22
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00100111011101110000011010100111;
		b = 32'b11001111001110010110001001010100;
		correct = 32'b01001111001110010110001001010100;
		#400 //3.4281742e-15 * -3110229000.0 = 3110229000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00100000011100100111110111100001;
		b = 32'b00010110000001010111111101110001;
		correct = 32'b00100000011100100111110111011001;
		#400 //2.0539847e-19 * 1.0783868e-25 = 2.0539837e-19
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10100000101101110001110111000100;
		b = 32'b01011001010011000001101011000100;
		correct = 32'b11011001010011000001101011000100;
		#400 //-3.1021103e-19 * 3590645300000000.0 = -3590645300000000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10000110010110101010111010110010;
		b = 32'b10000011101011110001000110000001;
		correct = 32'b10000110010101010011011000100110;
		#400 //-4.112959e-35 * -1.0289594e-36 = -4.010063e-35
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10001000110000110011000001110011;
		b = 32'b01100001101010101011001111111100;
		correct = 32'b11100001101010101011001111111100;
		#400 //-1.1747526e-33 * 3.9361447e+20 = -3.9361447e+20
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01100100100010100001010101111101;
		b = 32'b01001101100110000000101010010101;
		correct = 32'b01100100100010100001010101111101;
		#400 //2.0377593e+22 * 318853800.0 = 2.0377593e+22
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10010001001111010111110001001110;
		b = 32'b10100011101111011001010100110111;
		correct = 32'b00100011101111011001010100110111;
		#400 //-1.4947775e-28 * -2.0554616e-17 = 2.0554616e-17
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01111011011111110111100100001010;
		b = 32'b11010111011010001001001000101011;
		correct = 32'b01111011011111110111100100001010;
		#400 //1.3264907e+36 * -255714480000000.0 = 1.3264907e+36
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00100010101011111101110111110000;
		b = 32'b01000110111110011110101101000111;
		correct = 32'b11000110111110011110101101000111;
		#400 //4.766883e-18 * 31989.639 = -31989.639
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00111101011000111001101100100100;
		b = 32'b00100100001010100111010111011000;
		correct = 32'b00111101011000111001101100100100;
		#400 //0.055567876 * 3.696269e-17 = 0.055567876
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00100101010101111111010000110111;
		b = 32'b01000010000011110110001000011100;
		correct = 32'b11000010000011110110001000011100;
		#400 //1.873102e-16 * 35.84581 = -35.84581
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00101011110001101000101001100000;
		b = 32'b11010010100111000000010010110101;
		correct = 32'b01010010100111000000010010110101;
		#400 //1.4107153e-12 * -335046930000.0 = 335046930000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00110101101011100100110110101101;
		b = 32'b00011100101001101101000000101100;
		correct = 32'b00110101101011100100110110101101;
		#400 //1.2986617e-06 * 1.103877e-21 = 1.2986617e-06
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10101010010101011110000100001010;
		b = 32'b10110111010101110111100100000011;
		correct = 32'b00110111010101110111100100000011;
		#400 //-1.8996276e-13 * -1.2843174e-05 = 1.2843174e-05
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00010100010011001001010011000110;
		b = 32'b11100101110100000010000011101101;
		correct = 32'b01100101110100000010000011101101;
		#400 //1.0328708e-26 * -1.2285745e+23 = 1.2285745e+23
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11011110010100111110110111001110;
		b = 32'b01010010000110000000110001110101;
		correct = 32'b11011110010100111110110111001111;
		#400 //-3.817772e+18 * 163261000000.0 = -3.8177724e+18
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11001001110100001101010101010110;
		b = 32'b10000111011100001010000000001111;
		correct = 32'b11001001110100001101010101010110;
		#400 //-1710762.8 * -1.810263e-34 = -1710762.8
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11101001010111000110110101101001;
		b = 32'b01010110100110001110011000101000;
		correct = 32'b11101001010111000110110101101001;
		#400 //-1.6655022e+25 * 84057140000000.0 = -1.6655022e+25
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11001100111001110011110111000111;
		b = 32'b10011100001100111100010000000011;
		correct = 32'b11001100111001110011110111000111;
		#400 //-121237050.0 * -5.947947e-22 = -121237050.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11010110100001111011010001010101;
		b = 32'b00011100010010000000000000101001;
		correct = 32'b11010110100001111011010001010101;
		#400 //-74604295000000.0 * 6.6174656e-22 = -74604295000000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11110000100100111001011101101101;
		b = 32'b00001110110000111010011011100110;
		correct = 32'b11110000100100111001011101101101;
		#400 //-3.6541887e+29 * 4.823193e-30 = -3.6541887e+29
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10001011111011111001000110110101;
		b = 32'b10101101000001101101011101111000;
		correct = 32'b00101101000001101101011101111000;
		#400 //-9.2278687e-32 * -7.664862e-12 = 7.664862e-12
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01101000110000100110000100010001;
		b = 32'b00010110000100110110000111111101;
		correct = 32'b01101000110000100110000100010001;
		#400 //7.343437e+24 * 1.1905485e-25 = 7.343437e+24
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11100001011110110110110010101000;
		b = 32'b11011110111001111011010110000000;
		correct = 32'b11100001011101000010111011111100;
		#400 //-2.8987264e+20 * -8.348196e+18 = -2.8152445e+20
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00011010001010001011110000111010;
		b = 32'b10111010001011011100100000110100;
		correct = 32'b00111010001011011100100000110100;
		#400 //3.4893634e-23 * -0.0006629259 = 0.0006629259
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00101101101000000111011111011110;
		b = 32'b01000010101011000010111111000000;
		correct = 32'b11000010101011000010111111000000;
		#400 //1.8243126e-11 * 86.09326 = -86.09326
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10100100110000000010010110111001;
		b = 32'b00111000011101111010010001101011;
		correct = 32'b10111000011101111010010001101011;
		#400 //-8.333063e-17 * 5.9042515e-05 = -5.9042515e-05
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11000110000110111001101000111101;
		b = 32'b00011111001001110111111000100110;
		correct = 32'b11000110000110111001101000111101;
		#400 //-9958.56 * 3.5467973e-20 = -9958.56
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10010000000111111011010001101000;
		b = 32'b00011010100111011010101000111001;
		correct = 32'b10011010100111011010101000111110;
		#400 //-3.14962e-29 * 6.520869e-23 = -6.520872e-23
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00110111111110111001011100101101;
		b = 32'b01010110001101010111011101101100;
		correct = 32'b11010110001101010111011101101100;
		#400 //2.9991928e-05 * 49881130000000.0 = -49881130000000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10110001000010001111110101010011;
		b = 32'b00001101010011111010011011001011;
		correct = 32'b10110001000010001111110101010011;
		#400 //-1.9934603e-09 * 6.398757e-31 = -1.9934603e-09
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01001011101000110110101111101111;
		b = 32'b01111110010010101001001111010100;
		correct = 32'b11111110010010101001001111010100;
		#400 //21419998.0 * 6.7317906e+37 = -6.7317906e+37
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10000100010000100000000010001011;
		b = 32'b01101110011101001110010001010010;
		correct = 32'b11101110011101001110010001010010;
		#400 //-2.280484e-36 * 1.8947591e+28 = -1.8947591e+28
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11100000010011111100111001111010;
		b = 32'b10000011000101100100100101000101;
		correct = 32'b11100000010011111100111001111010;
		#400 //-5.989616e+19 * -4.4165147e-37 = -5.989616e+19
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01111001010110000111010100110100;
		b = 32'b01010011100101100110110111010111;
		correct = 32'b01111001010110000111010100110100;
		#400 //7.024458e+34 * 1292175800000.0 = 7.024458e+34
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00001100100001100111110101100100;
		b = 32'b10000010011000100010100101010001;
		correct = 32'b00001100100001100111110101101011;
		#400 //2.0721436e-31 * -1.6615715e-37 = 2.0721452e-31
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11111111011000110000101001011000;
		b = 32'b10001000111010111100111101110110;
		correct = 32'b11111111011000110000101001011000;
		#400 //-3.0178846e+38 * -1.4192322e-33 = -3.0178846e+38
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00010100100111111000110011110110;
		b = 32'b01010000100111010010110111010011;
		correct = 32'b11010000100111010010110111010011;
		#400 //1.6110496e-26 * 21096208000.0 = -21096208000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11100100011111000111100100000111;
		b = 32'b10011000001100111000000011101110;
		correct = 32'b11100100011111000111100100000111;
		#400 //-1.8629202e+22 * -2.32003e-24 = -1.8629202e+22
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01111010001110100101010011110010;
		b = 32'b01101010111000110110011101101110;
		correct = 32'b01111010001110100101010011110010;
		#400 //2.4187253e+35 * 1.374573e+26 = 2.4187253e+35
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11100010001111100000100010111001;
		b = 32'b10001001101001000100011101100110;
		correct = 32'b11100010001111100000100010111001;
		#400 //-8.763775e+20 * -3.9548707e-33 = -8.763775e+20
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11001101001100011011000010101110;
		b = 32'b10110011011010101000111101110100;
		correct = 32'b11001101001100011011000010101110;
		#400 //-186321630.0 * -5.461284e-08 = -186321630.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00111001001111100101111010001101;
		b = 32'b01110101010000111011010011010100;
		correct = 32'b11110101010000111011010011010100;
		#400 //0.00018155035 * 2.4808728e+32 = -2.4808728e+32
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10100100011010011000101000000111;
		b = 32'b10100100100010010110011100010011;
		correct = 32'b00100011001001010001000001111100;
		#400 //-5.0640735e-17 * -5.9588894e-17 = 8.948159e-18
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00100001110110000010011101010010;
		b = 32'b10101000101001010011100010001000;
		correct = 32'b00101000101001010011101111101001;
		#400 //1.4647137e-18 * -1.8343196e-14 = 1.8344662e-14
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10101101100101110011110011100110;
		b = 32'b00000010101010100100101101110111;
		correct = 32'b10101101100101110011110011100110;
		#400 //-1.7193757e-11 * 2.502257e-37 = -1.7193757e-11
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01011011000101000110000000101111;
		b = 32'b11000001000000110111001101000110;
		correct = 32'b01011011000101000110000000101111;
		#400 //4.176405e+16 * -8.215643 = 4.176405e+16
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10011100111000010001100000011010;
		b = 32'b01101110110011000001001001010011;
		correct = 32'b11101110110011000001001001010011;
		#400 //-1.4895481e-21 * 3.1578547e+28 = -3.1578547e+28
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11010101011100100111011010010011;
		b = 32'b10011010110110111010100100000001;
		correct = 32'b11010101011100100111011010010011;
		#400 //-16661943000000.0 * -9.084932e-23 = -16661943000000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10111011100101101010001000110011;
		b = 32'b00100000111011100110101000011111;
		correct = 32'b10111011100101101010001000110011;
		#400 //-0.0045969724 * 4.0388993e-19 = -0.0045969724
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01010101101110010001111000010111;
		b = 32'b01011000110110010011010001110100;
		correct = 32'b11011000110101100100111111111100;
		#400 //25442360000000.0 * 1910554500000000.0 = -1885112100000000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10001010010101011101100100110011;
		b = 32'b10010010011111010111010100101110;
		correct = 32'b00010010011111010111010001011000;
		#400 //-1.02964276e-32 * -7.997716e-28 = 7.997613e-28
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11001111001001111101010110111000;
		b = 32'b00010111111111000001110110111110;
		correct = 32'b11001111001001111101010110111000;
		#400 //-2815801300.0 * 1.6292626e-24 = -2815801300.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10000010100000110000111001111001;
		b = 32'b00000100111010001100101111001101;
		correct = 32'b10000100111100001111110010110101;
		#400 //-1.9257027e-37 * 5.47301e-36 = -5.6655804e-36
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00000000101011010100111010100000;
		b = 32'b10110001101100010111001001100011;
		correct = 32'b00110001101100010111001001100011;
		#400 //1.5915746e-38 * -5.1643823e-09 = 5.1643823e-09
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10000001101010100100111010001001;
		b = 32'b00010010000100011100100111000001;
		correct = 32'b10010010000100011100100111000001;
		#400 //-6.256083e-38 * 4.6002613e-28 = -4.6002613e-28
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11001011100111111110101011111010;
		b = 32'b01011111011110101110001111000101;
		correct = 32'b11011111011110101110001111000101;
		#400 //-20960756.0 * 1.807851e+19 = -1.807851e+19
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00111011011011101100111010110111;
		b = 32'b11111001100000000110101110001001;
		correct = 32'b01111001100000000110101110001001;
		#400 //0.003643913 * -8.334938e+34 = 8.334938e+34
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01101000101000110101111010010001;
		b = 32'b01111100100101010000100000011111;
		correct = 32'b11111100100101010000100000011111;
		#400 //6.1719214e+24 * 6.1905356e+36 = -6.1905356e+36
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00000111100110101011001001001110;
		b = 32'b11010100100111001101111010010011;
		correct = 32'b01010100100111001101111010010011;
		#400 //2.3276143e-34 * -5389992600000.0 = 5389992600000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11110101010100110010011100100011;
		b = 32'b11111100100110110010111101001110;
		correct = 32'b01111100100110110010110110101000;
		#400 //-2.6766807e+32 * -6.446124e+36 = 6.445856e+36
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01100101111010000011011011110110;
		b = 32'b11111100111000110011000101100111;
		correct = 32'b01111100111000110011000101100111;
		#400 //1.3707536e+23 * -9.437227e+36 = 9.437227e+36
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11100011101111100101011010110110;
		b = 32'b00111010010011010000100001010011;
		correct = 32'b11100011101111100101011010110110;
		#400 //-7.022259e+21 * 0.000782137 = -7.022259e+21
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01100010111101111010000000101001;
		b = 32'b00011100001001110001111110110001;
		correct = 32'b01100010111101111010000000101001;
		#400 //2.2839433e+21 * 5.5296625e-22 = 2.2839433e+21
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11101000010000100110100100010011;
		b = 32'b00111010100000110101011101111111;
		correct = 32'b11101000010000100110100100010011;
		#400 //-3.6723095e+24 * 0.0010020583 = -3.6723095e+24
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10010111111100000111111010000111;
		b = 32'b00000010010000110001111101110000;
		correct = 32'b10010111111100000111111010000111;
		#400 //-1.5541576e-24 * 1.433536e-37 = -1.5541576e-24
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10000110000011011100001111011110;
		b = 32'b01000101010001110100011110110011;
		correct = 32'b11000101010001110100011110110011;
		#400 //-2.6663053e-35 * 3188.4812 = -3188.4812
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10110100100100110111000010110100;
		b = 32'b11110000010100111011010110011101;
		correct = 32'b01110000010100111011010110011101;
		#400 //-2.7462886e-07 * -2.6208358e+29 = 2.6208358e+29
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01001101100111001100000111001101;
		b = 32'b11000011011000000100001010001010;
		correct = 32'b01001101100111001100000111010100;
		#400 //328743330.0 * -224.25992 = 328743550.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01000110011100100000011000110001;
		b = 32'b10001110101101011001011100000001;
		correct = 32'b01000110011100100000011000110001;
		#400 //15489.548 * -4.4765356e-30 = 15489.548
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00110110000010100000100111101000;
		b = 32'b00111100010100100110110010101110;
		correct = 32'b10111100010100100110010000001101;
		#400 //2.0569369e-06 * 0.012843294 = -0.012841237
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11000111011001100000100010100011;
		b = 32'b00111111000100001110001101101101;
		correct = 32'b11000111011001100000100100110100;
		#400 //-58888.637 * 0.56597024 = -58889.203
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00100110101001011000111110101000;
		b = 32'b10001000110000011011000111010010;
		correct = 32'b00100110101001011000111110101000;
		#400 //1.1488113e-15 * -1.165757e-33 = 1.1488113e-15
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00000001001000100001110000111111;
		b = 32'b00011100011011011100000001101111;
		correct = 32'b10011100011011011100000001101111;
		#400 //2.9774966e-38 * 7.8665437e-22 = -7.8665437e-22
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11111110100100111010010111000100;
		b = 32'b11010011111110010111001011011110;
		correct = 32'b11111110100100111010010111000100;
		#400 //-9.812861e+37 * -2142748000000.0 = -9.812861e+37
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11000101011111000111100001110111;
		b = 32'b11001011111111110101110001101110;
		correct = 32'b01001011111111110101010010001010;
		#400 //-4039.529 * -33470684.0 = 33466644.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00111110011000101100011010001010;
		b = 32'b00010011010110010111101100110001;
		correct = 32'b00111110011000101100011010001010;
		#400 //0.22146049 * 2.7449989e-27 = 0.22146049
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11100001000010001001010111101011;
		b = 32'b01010001111111010111111010111100;
		correct = 32'b11100001000010001001010111101011;
		#400 //-1.574725e+20 * 136094120000.0 = -1.574725e+20
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11000000001110101101100010001010;
		b = 32'b10111111010001000101100011101010;
		correct = 32'b11000000000010011100001001010000;
		#400 //-2.9194665 * -0.7669817 = -2.152485
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10011101100111001101001001101001;
		b = 32'b10010110011000101010111100001010;
		correct = 32'b10011101100111001101000010100100;
		#400 //-4.1510415e-21 * -1.8311367e-25 = -4.1508586e-21
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10111111000101010100000001001010;
		b = 32'b10000101100001000111101010010100;
		correct = 32'b10111111000101010100000001001010;
		#400 //-0.5830122 * -1.2458248e-35 = -0.5830122
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01011111000011100010110100110000;
		b = 32'b10010111011110101111010011000101;
		correct = 32'b01011111000011100010110100110000;
		#400 //1.0244898e+19 * -8.10883e-25 = 1.0244898e+19
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01010110001011010001110001000010;
		b = 32'b11111101110111011101011001000101;
		correct = 32'b01111101110111011101011001000101;
		#400 //47584220000000.0 * -3.6858992e+37 = 3.6858992e+37
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00000011110001110100011100011011;
		b = 32'b00001100000101001101000000000110;
		correct = 32'b10001100000101001100111110100010;
		#400 //1.1712494e-36 * 1.1464105e-31 = -1.1463987e-31
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00110101100111101110010101111000;
		b = 32'b01000001011100001010111001011000;
		correct = 32'b11000001011100001010111001010111;
		#400 //1.1838702e-06 * 15.042564 = -15.042563
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01010110010111011101001110110000;
		b = 32'b00100100011001000000101111011000;
		correct = 32'b01010110010111011101001110110000;
		#400 //60975315000000.0 * 4.944965e-17 = 60975315000000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01000010111111011101111000111001;
		b = 32'b11111011011110100000101011011100;
		correct = 32'b01111011011110100000101011011100;
		#400 //126.93403 * -1.2982945e+36 = 1.2982945e+36
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10101101010001011111101110100000;
		b = 32'b01100011101101111001001111010111;
		correct = 32'b11100011101101111001001111010111;
		#400 //-1.12540255e-11 * 6.7728143e+21 = -6.7728143e+21
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01000000100011001001110010111110;
		b = 32'b11100100110000100111110001010100;
		correct = 32'b01100100110000100111110001010100;
		#400 //4.3941336 * -2.8701017e+22 = 2.8701017e+22
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01011011011111011011001010100000;
		b = 32'b11000010100000110110011010001001;
		correct = 32'b01011011011111011011001010100000;
		#400 //7.140957e+16 * -65.700264 = 7.140957e+16
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01011001000101000001110110001001;
		b = 32'b01100100010100001110111100111000;
		correct = 32'b11100100010100001110111100110110;
		#400 //2605673200000000.0 * 1.5416641e+22 = -1.5416639e+22
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00110011101111010011111110110001;
		b = 32'b01010010111011000001000001010001;
		correct = 32'b11010010111011000001000001010001;
		#400 //8.812584e-08 * 506943000000.0 = -506943000000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00000010101000000111110011000100;
		b = 32'b01100100111001010000101100111000;
		correct = 32'b11100100111001010000101100111000;
		#400 //2.35815e-37 * 3.3800902e+22 = -3.3800902e+22
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00101101100100110011111101110001;
		b = 32'b01000001011011110111010101011001;
		correct = 32'b11000001011011110111010101011001;
		#400 //1.6740139e-11 * 14.966149 = -14.966149
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00000001101100101100110001111010;
		b = 32'b10111000010001011111100101010000;
		correct = 32'b00111000010001011111100101010000;
		#400 //6.568028e-38 * -4.720065e-05 = 4.720065e-05
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10011100001010010000111010110001;
		b = 32'b10110000010110011100110111011001;
		correct = 32'b00110000010110011100110111011001;
		#400 //-5.59364e-22 * -7.923667e-10 = 7.923667e-10
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01101110110110101011001100010110;
		b = 32'b11111001100111111001001010001110;
		correct = 32'b01111001100111111001001010010001;
		#400 //3.3842117e+28 * -1.0356846e+35 = 1.0356849e+35
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01101011011110101100100001111001;
		b = 32'b10000001011011101010110111110011;
		correct = 32'b01101011011110101100100001111001;
		#400 //3.0317816e+26 * -4.38385e-38 = 3.0317816e+26
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00010001010011101111110010101011;
		b = 32'b00000000000111110000100100110000;
		correct = 32'b00010001010011101111110010101011;
		#400 //1.6328394e-28 * 2.850196e-39 = 1.6328394e-28
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01010011011010010110000110011001;
		b = 32'b01010001101000010011011101100110;
		correct = 32'b01010011010101010011101010101100;
		#400 //1002364800000.0 * 86552396000.0 = 915812400000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10001100110100101001001100110011;
		b = 32'b01000010101001100111001101011011;
		correct = 32'b11000010101001100111001101011011;
		#400 //-3.2444215e-31 * 83.2253 = -83.2253
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01110010011001110001100001011110;
		b = 32'b11000010011001110010100100001100;
		correct = 32'b01110010011001110001100001011110;
		#400 //4.5773117e+30 * -57.790085 = 4.5773117e+30
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10111111111010000010010110101011;
		b = 32'b10100101010101010111110001100100;
		correct = 32'b10111111111010000010010110101011;
		#400 //-1.8136495 * -1.851695e-16 = -1.8136495
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11001011011100101101111010010001;
		b = 32'b00100000101011000110110011110110;
		correct = 32'b11001011011100101101111010010001;
		#400 //-15916689.0 * 2.9210038e-19 = -15916689.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00111110110111111100110010100011;
		b = 32'b11011101011000101111101000110001;
		correct = 32'b01011101011000101111101000110001;
		#400 //0.43710813 * -1.0222149e+18 = 1.0222149e+18
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01000101010010101011101100001101;
		b = 32'b11111100001010001111101101100011;
		correct = 32'b01111100001010001111101101100011;
		#400 //3243.6907 * -3.5096184e+36 = 3.5096184e+36
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10001100101000110110110001110111;
		b = 32'b00100100000011110011100110110001;
		correct = 32'b10100100000011110011100110110001;
		#400 //-2.5179406e-31 * 3.105705e-17 = -3.105705e-17
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00000000001000111001100000110101;
		b = 32'b10001000100011011001101001100111;
		correct = 32'b00001000100011011001101010001011;
		#400 //3.268844e-39 * -8.522429e-34 = 8.522462e-34
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11101001010101011001011101111111;
		b = 32'b11000110001110101110011100111100;
		correct = 32'b11101001010101011001011101111111;
		#400 //-1.6138539e+25 * -11961.809 = -1.6138539e+25
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00111011011010000111000111011001;
		b = 32'b01011000000100101011100100100100;
		correct = 32'b11011000000100101011100100100100;
		#400 //0.003546825 * 645295500000000.0 = -645295500000000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00000000000010101000011010100011;
		b = 32'b11001000010001010011001100000010;
		correct = 32'b01001000010001010011001100000010;
		#400 //9.66654e-40 * -201932.03 = 201932.03
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10101110101110001011011001110110;
		b = 32'b00100001010000110000011000001110;
		correct = 32'b10101110101110001011011001110110;
		#400 //-8.399763e-11 * 6.6076583e-19 = -8.399763e-11
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10100100110101011011110110001011;
		b = 32'b00000100000000011111011111110000;
		correct = 32'b10100100110101011011110110001011;
		#400 //-9.2695123e-17 * 1.5277724e-36 = -9.2695123e-17
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00000001100011111011111101100000;
		b = 32'b11111110011011010010100000010110;
		correct = 32'b01111110011011010010100000010110;
		#400 //5.2804513e-38 * -7.8808793e+37 = 7.8808793e+37
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11101010110001001100101110011011;
		b = 32'b00100111001000111100110011000111;
		correct = 32'b11101010110001001100101110011011;
		#400 //-1.1895548e+26 * 2.2731804e-15 = -1.1895548e+26
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11101011101000111101111001010001;
		b = 32'b01101101010010010110101111110101;
		correct = 32'b11101101010111011110011110111111;
		#400 //-3.9620954e+26 * 3.8960624e+27 = -4.292272e+27
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01010111001101100000101011010101;
		b = 32'b00010010100000011101110111110111;
		correct = 32'b01010111001101100000101011010101;
		#400 //200157640000000.0 * 8.195763e-28 = 200157640000000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00011001011011000010001011100011;
		b = 32'b11111001010110010010001011000111;
		correct = 32'b01111001010110010010001011000111;
		#400 //1.2207959e-23 * -7.046461e+34 = 7.046461e+34
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10101000011010100110000010010111;
		b = 32'b00110101110110101101001011010110;
		correct = 32'b10110101110110101101001011010110;
		#400 //-1.3010554e-14 * 1.6303627e-06 = -1.6303627e-06
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10111100101010111101010100101100;
		b = 32'b10001011110100011101110011011011;
		correct = 32'b10111100101010111101010100101100;
		#400 //-0.020975672 * -8.083618e-32 = -0.020975672
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01011101111001101100001000010011;
		b = 32'b01101011111101110001000110111010;
		correct = 32'b11101011111101110001000110111010;
		#400 //2.0784842e+18 * 5.9737678e+26 = -5.9737678e+26
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01011010011110000000101010001001;
		b = 32'b00010001010110111000100010111001;
		correct = 32'b01011010011110000000101010001001;
		#400 //1.7454344e+16 * 1.7318185e-28 = 1.7454344e+16
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10000000010010000011101001101000;
		b = 32'b11000000101010010110111100100100;
		correct = 32'b01000000101010010110111100100100;
		#400 //-6.633108e-39 * -5.294817 = 5.294817
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10000001000111001101100011000000;
		b = 32'b10100100101110000010100000110000;
		correct = 32'b00100100101110000010100000110000;
		#400 //-2.8808185e-38 * -7.986536e-17 = 7.986536e-17
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10101110001110110111101100110001;
		b = 32'b10110110111110110010000110100010;
		correct = 32'b00110110111110110010000101000100;
		#400 //-4.2628293e-11 * -7.4842983e-06 = 7.4842555e-06
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00101110100010110000110100010000;
		b = 32'b11110100110100110101000100010100;
		correct = 32'b01110100110100110101000100010100;
		#400 //6.3233085e-11 * -1.3393788e+32 = 1.3393788e+32
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01101101101011101110111111011010;
		b = 32'b00011110101100011011100011110000;
		correct = 32'b01101101101011101110111111011010;
		#400 //6.7675443e+27 * 1.8817092e-20 = 6.7675443e+27
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00000110000111000101111001111100;
		b = 32'b01100001010100001001001010001100;
		correct = 32'b11100001010100001001001010001100;
		#400 //2.9409755e-35 * 2.4046766e+20 = -2.4046766e+20
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11010101111111010100010110000110;
		b = 32'b00011101111101111110000000101001;
		correct = 32'b11010101111111010100010110000110;
		#400 //-34809380000000.0 * 6.561213e-21 = -34809380000000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10001101001111101101000111111110;
		b = 32'b10010001111111100001101100101110;
		correct = 32'b00010001111111011011101111000101;
		#400 //-5.880104e-31 * -4.0090885e-28 = 4.0032084e-28
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11101110010101001001111101101111;
		b = 32'b10110000000011100010110011010010;
		correct = 32'b11101110010101001001111101101111;
		#400 //-1.6450891e+28 * -5.172299e-10 = -1.6450891e+28
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00001100000000111110010100011001;
		b = 32'b11011011010101000011000111100101;
		correct = 32'b01011011010101000011000111100101;
		#400 //1.0160814e-31 * -5.9727555e+16 = 5.9727555e+16
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11101110001111000000101001110001;
		b = 32'b10010000111010101001011101000110;
		correct = 32'b11101110001111000000101001110001;
		#400 //-1.4548951e+28 * -9.25298e-29 = -1.4548951e+28
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01111110110111111011001111110001;
		b = 32'b10000010110111001111001110101001;
		correct = 32'b01111110110111111011001111110001;
		#400 //1.4867608e+38 * -3.2465949e-37 = 1.4867608e+38
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01011100010101001010110100010001;
		b = 32'b01000010110100011100111000111101;
		correct = 32'b01011100010101001010110100010001;
		#400 //2.3945193e+17 * 104.90281 = 2.3945193e+17
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10011111001011111101111001011100;
		b = 32'b10011111000110011010010010100111;
		correct = 32'b10011101101100011100110110101000;
		#400 //-3.7241623e-20 * -3.2535207e-20 = -4.7064153e-21
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10101111010011101111101111111100;
		b = 32'b11010001010010011010000011110000;
		correct = 32'b01010001010010011010000011110000;
		#400 //-1.8825114e-10 * -54124280000.0 = 54124280000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10101111111111010010000111100111;
		b = 32'b00100001011110010101001000010111;
		correct = 32'b10101111111111010010000111100111;
		#400 //-4.604452e-10 * 8.4473127e-19 = -4.604452e-10
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01101010010000111010101011110101;
		b = 32'b01000000001001101110010011111101;
		correct = 32'b01101010010000111010101011110101;
		#400 //5.9136964e+25 * 2.6077263 = 5.9136964e+25
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01110111010100111110001010001101;
		b = 32'b00100000010111111001000111111100;
		correct = 32'b01110111010100111110001010001101;
		#400 //4.2975376e+33 * 1.8937137e-19 = 4.2975376e+33
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10101100011110111101001010111100;
		b = 32'b10011010111101000100111110010110;
		correct = 32'b10101100011110111101001010111100;
		#400 //-3.5786226e-12 * -1.0104461e-22 = -3.5786226e-12
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10011110011100000001001010000100;
		b = 32'b01011000001110010011010111101000;
		correct = 32'b11011000001110010011010111101000;
		#400 //-1.2709323e-20 * 814564700000000.0 = -814564700000000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10110011001000101110011111000011;
		b = 32'b10000000000111100001011011110001;
		correct = 32'b10110011001000101110011111000011;
		#400 //-3.792935e-08 * -2.763295e-39 = -3.792935e-08
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11000001110111000100110011110100;
		b = 32'b00100101001000100101111101000000;
		correct = 32'b11000001110111000100110011110100;
		#400 //-27.537575 * 1.4083532e-16 = -27.537575
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01000011111100011111100110000111;
		b = 32'b01000111111101101010101010101111;
		correct = 32'b11000111111101011011100010110101;
		#400 //483.94943 * 126293.37 = -125809.414
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11111011000111011000100100111001;
		b = 32'b10110000001010011001010000010010;
		correct = 32'b11111011000111011000100100111001;
		#400 //-8.179738e+35 * -6.169226e-10 = -8.179738e+35
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10110001000010001100111100011111;
		b = 32'b00000000101001101010010010011100;
		correct = 32'b10110001000010001100111100011111;
		#400 //-1.990834e-09 * 1.5303743e-38 = -1.990834e-09
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01010001011011101110011000101010;
		b = 32'b11010110100100101110001101001010;
		correct = 32'b01010110100100110000000100100111;
		#400 //64128983000.0 * -80752450000000.0 = 80816580000000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10100010111001000001010101000011;
		b = 32'b01100110010001010111011010000001;
		correct = 32'b11100110010001010111011010000001;
		#400 //-6.1822036e-18 * 2.3312305e+23 = -2.3312305e+23
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01111100111111000100010001001111;
		b = 32'b11100010000111101101010000000101;
		correct = 32'b01111100111111000100010001001111;
		#400 //1.0478754e+37 * -7.324658e+20 = 1.0478754e+37
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00000010010010110000101001101010;
		b = 32'b00000000101010110000100110001111;
		correct = 32'b00000010001101011010100100111000;
		#400 //1.4917073e-37 * 1.5707299e-38 = 1.3346343e-37
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10010000001001000000001101001010;
		b = 32'b01110100100001110100101110101000;
		correct = 32'b11110100100001110100101110101000;
		#400 //-3.234583e-29 * 8.575373e+31 = -8.575373e+31
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11001111101000110110001100001101;
		b = 32'b00011101011101011000010000000100;
		correct = 32'b11001111101000110110001100001101;
		#400 //-5482355000.0 * 3.249373e-21 = -5482355000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01100111111010101001101110110100;
		b = 32'b00110010001100101101101010001110;
		correct = 32'b01100111111010101001101110110100;
		#400 //2.215812e+24 * 1.0410657e-08 = 2.215812e+24
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00011110101000010010010110111001;
		b = 32'b10011110001111110100101100101100;
		correct = 32'b00011111000000000110010110101000;
		#400 //1.706214e-20 * -1.0127001e-20 = 2.7189142e-20
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00111110101011011111011011101001;
		b = 32'b01101100100110011000100111000010;
		correct = 32'b11101100100110011000100111000010;
		#400 //0.3397744 * 1.4849295e+27 = -1.4849295e+27
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01100011110011100101010011101101;
		b = 32'b01010000101011110101111110000001;
		correct = 32'b01100011110011100101010011101101;
		#400 //7.6122977e+21 * 23538174000.0 = 7.6122977e+21
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10001001000100110000101111101011;
		b = 32'b00011000010010101011011110100101;
		correct = 32'b10011000010010101011011110100101;
		#400 //-1.7700085e-33 * 2.6200605e-24 = -2.6200605e-24
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10010101010101010110001000000011;
		b = 32'b01101000101111111110000001110010;
		correct = 32'b11101000101111111110000001110010;
		#400 //-4.3092325e-26 * 7.248898e+24 = -7.248898e+24
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01110101100110010011001110000101;
		b = 32'b01101110000101001111101011110010;
		correct = 32'b01110101100110010011001001011011;
		#400 //3.884113e+32 * 1.1526789e+28 = 3.8839978e+32
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00010100111111100100110100010101;
		b = 32'b01000000001111101011101110010010;
		correct = 32'b11000000001111101011101110010010;
		#400 //2.567785e-26 * 2.9801984 = -2.9801984
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10110101111001011001001000110100;
		b = 32'b00101100010101010010000101000101;
		correct = 32'b10110101111001011001001001001111;
		#400 //-1.710438e-06 * 3.0287589e-12 = -1.7104411e-06
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10100011110100100100001111000110;
		b = 32'b01000000101001101101000011010111;
		correct = 32'b11000000101001101101000011010111;
		#400 //-2.2796949e-17 * 5.212993 = -5.212993
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01000100000110011011010101000001;
		b = 32'b11100111100010100010100111011000;
		correct = 32'b01100111100010100010100111011000;
		#400 //614.8321 * -1.3049169e+24 = 1.3049169e+24
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11111011111000110011001101011001;
		b = 32'b10011001010000111011001111011011;
		correct = 32'b11111011111000110011001101011001;
		#400 //-2.3593857e+36 * -1.0117585e-23 = -2.3593857e+36
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01010010111001011000111101101111;
		b = 32'b10111100101110010000010011110001;
		correct = 32'b01010010111001011000111101101111;
		#400 //492976960000.0 * -0.022585364 = 492976960000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00011100100010110110110001101010;
		b = 32'b10001011011011010101111010110011;
		correct = 32'b00011100100010110110110001101010;
		#400 //9.226273e-22 * -4.5715783e-32 = 9.226273e-22
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01110101110111010101011011011110;
		b = 32'b01100010100100000100101100010001;
		correct = 32'b01110101110111010101011011011110;
		#400 //5.6116186e+32 * 1.3308701e+21 = 5.6116186e+32
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10011011111101100111000100000100;
		b = 32'b11010100100011010100000101101101;
		correct = 32'b01010100100011010100000101101101;
		#400 //-4.077032e-22 * -4853504400000.0 = 4853504400000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00101111101111000001000000101000;
		b = 32'b00100110100110001000011110011101;
		correct = 32'b00101111101111000001000000000010;
		#400 //3.420848e-10 * 1.0583877e-15 = 3.4208375e-10
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11001001101101100011110001011100;
		b = 32'b00000001100101001101011010100101;
		correct = 32'b11001001101101100011110001011100;
		#400 //-1492875.5 * 5.4674614e-38 = -1492875.5
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00111010101001100011111100010011;
		b = 32'b11001101110101000111001111111100;
		correct = 32'b01001101110101000111001111111100;
		#400 //0.0012683593 * -445546370.0 = 445546370.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01111001111001110100111000000101;
		b = 32'b10010001100110110101101000001010;
		correct = 32'b01111001111001110100111000000101;
		#400 //1.5012537e+35 * -2.451018e-28 = 1.5012537e+35
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11001010011010110011010101111100;
		b = 32'b10011101111011101001100100111011;
		correct = 32'b11001010011010110011010101111100;
		#400 //-3853663.0 * -6.3156512e-21 = -3853663.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01001100110011110100010111000110;
		b = 32'b00100100100001111110101100111101;
		correct = 32'b01001100110011110100010111000110;
		#400 //108670510.0 * 5.8945426e-17 = 108670510.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00011000011111001110000010010110;
		b = 32'b11110100110101011110111011110101;
		correct = 32'b01110100110101011110111011110101;
		#400 //3.2683624e-24 * -1.3559642e+32 = 1.3559642e+32
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11110010001100010011100001100001;
		b = 32'b11111101111110100111100100011100;
		correct = 32'b01111101111110100111100100011011;
		#400 //-3.5102083e+30 * -4.161698e+37 = 4.1616977e+37
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00101001010011011101111000011010;
		b = 32'b10001111010011010111110001101101;
		correct = 32'b00101001010011011101111000011010;
		#400 //4.5711786e-14 * -1.0131244e-29 = 4.5711786e-14
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00001001011111010000111111111101;
		b = 32'b11010111001001111101101110110000;
		correct = 32'b01010111001001111101101110110000;
		#400 //3.0461285e-33 * -184562000000000.0 = 184562000000000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00010100101011001010000101001000;
		b = 32'b01010101011100101001011100101011;
		correct = 32'b11010101011100101001011100101011;
		#400 //1.7431176e-26 * 16670692000000.0 = -16670692000000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11101110100010001011101000011110;
		b = 32'b11000101010110100111110101110011;
		correct = 32'b11101110100010001011101000011110;
		#400 //-2.1157482e+28 * -3495.8406 = -2.1157482e+28
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11011011011000000111100011100000;
		b = 32'b00110011000110100010010101110011;
		correct = 32'b11011011011000000111100011100000;
		#400 //-6.31833e+16 * 3.588998e-08 = -6.31833e+16
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01010011101001011111101101110010;
		b = 32'b01101001111001101001101010111010;
		correct = 32'b11101001111001101001101010111010;
		#400 //1425776300000.0 * 3.4847952e+25 = -3.4847952e+25
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11011000000011110100000011111101;
		b = 32'b11101010010111011000000011011000;
		correct = 32'b01101010010111011000000011011000;
		#400 //-630037140000000.0 * -6.6945263e+25 = 6.6945263e+25
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10011101101100011000111010111000;
		b = 32'b00010000111011101011010100011010;
		correct = 32'b10011101101100011000111010111000;
		#400 //-4.6999078e-21 * 9.415348e-29 = -4.6999078e-21
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10010010001000001111011000001001;
		b = 32'b10111001101000101010010010011101;
		correct = 32'b00111001101000101010010010011101;
		#400 //-5.079036e-28 * -0.00031021694 = 0.00031021694
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01101111001001001010000010100000;
		b = 32'b10011101001111110101101101100101;
		correct = 32'b01101111001001001010000010100000;
		#400 //5.0949725e+28 * -2.532589e-21 = 5.0949725e+28
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11111110011101010100001000101101;
		b = 32'b11111100110000110111001001000110;
		correct = 32'b11111110010111001101001111100100;
		#400 //-8.1501116e+37 * -8.118525e+36 = -7.338259e+37
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10000001001010011110001101110101;
		b = 32'b01000100000111000001001110100111;
		correct = 32'b11000100000111000001001110100111;
		#400 //-3.120359e-38 * 624.30707 = -624.30707
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11101101100101011001010100101111;
		b = 32'b11110110011001011000101101101011;
		correct = 32'b01110110011001011000101100100000;
		#400 //-5.7867023e+27 * -1.1639294e+33 = 1.1639236e+33
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11110110010011110111101010000011;
		b = 32'b11101000000010010111010110010111;
		correct = 32'b11110110010011110111101010000011;
		#400 //-1.0520413e+33 * -2.5965334e+24 = -1.0520413e+33
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11010010111011101110101000010011;
		b = 32'b00100010010110001110001000111100;
		correct = 32'b11010010111011101110101000010011;
		#400 //-513064670000.0 * 2.9393226e-18 = -513064670000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10100010011010010100110011010001;
		b = 32'b01111000010000101110000000001111;
		correct = 32'b11111000010000101110000000001111;
		#400 //-3.1618055e-18 * 1.5810157e+34 = -1.5810157e+34
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11010000011100110011101100000101;
		b = 32'b11110111111001011101111100010111;
		correct = 32'b01110111111001011101111100010111;
		#400 //-16322926000.0 * -9.3246936e+33 = 9.3246936e+33
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00111110001001011100111101110000;
		b = 32'b10000000010011010011100110100011;
		correct = 32'b00111110001001011100111101110000;
		#400 //0.16192412 * -7.09201e-39 = 0.16192412
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11110011100100111001101010010000;
		b = 32'b11011011000000110011011100110110;
		correct = 32'b11110011100100111001101010010000;
		#400 //-2.338875e+31 * -3.6933927e+16 = -2.338875e+31
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00111111111110011010110100000010;
		b = 32'b10100000101001000000101000011110;
		correct = 32'b00111111111110011010110100000010;
		#400 //1.9505923 * -2.7789376e-19 = 1.9505923
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01110100011000010000000100100000;
		b = 32'b00111001011111110010111011100111;
		correct = 32'b01110100011000010000000100100000;
		#400 //7.130674e+31 * 0.00024336168 = 7.130674e+31
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01001001101111100111011011110011;
		b = 32'b01100010110001100010111100010000;
		correct = 32'b11100010110001100010111100010000;
		#400 //1560286.4 * 1.8279233e+21 = -1.8279233e+21
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00011110011100011011100101100000;
		b = 32'b10110100101100101101000110011101;
		correct = 32'b00110100101100101101000110011101;
		#400 //1.27967684e-20 * -3.3307597e-07 = 3.3307597e-07
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10100101000111010111101101000000;
		b = 32'b10010001101001101111001110001011;
		correct = 32'b10100101000111010111101101000000;
		#400 //-1.3659338e-16 * -2.6340277e-28 = -1.3659338e-16
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00110101101000011010000100100010;
		b = 32'b00111000001001010010101100001010;
		correct = 32'b10111000001000000001111000000001;
		#400 //1.2042331e-06 * 3.937915e-05 = -3.8174916e-05
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01010001111010110011100001011101;
		b = 32'b00001011101110010100100001111001;
		correct = 32'b01010001111010110011100001011101;
		#400 //126282870000.0 * 7.136845e-32 = 126282870000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01111110101111000011101011010101;
		b = 32'b10111101111001011011000110010100;
		correct = 32'b01111110101111000011101011010101;
		#400 //1.2510017e+38 * -0.11215511 = 1.2510017e+38
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00011011100001010001001000110010;
		b = 32'b00011000110101000100011100110011;
		correct = 32'b00011011100000011100000100010101;
		#400 //2.2014763e-22 * 5.487261e-24 = 2.1466036e-22
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10011011011000101011100111101001;
		b = 32'b00001011000011111010101000100011;
		correct = 32'b10011011011000101011100111101001;
		#400 //-1.8754353e-22 * 2.7668795e-32 = -1.8754353e-22
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00110110100101111111001101100011;
		b = 32'b10100010011100011111001111011100;
		correct = 32'b00110110100101111111001101100011;
		#400 //4.5284846e-06 * -3.2790689e-18 = 4.5284846e-06
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10111010110101100100111100101110;
		b = 32'b01010000111110100100111101111110;
		correct = 32'b11010000111110100100111101111110;
		#400 //-0.0016350502 * 33596109000.0 = -33596109000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00001100101011000100000100111001;
		b = 32'b10101110010011011100011101100000;
		correct = 32'b00101110010011011100011101100000;
		#400 //2.654005e-31 * -4.6788684e-11 = 4.6788684e-11
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00101101101001111010000100100000;
		b = 32'b00111100110100000011000001101101;
		correct = 32'b10111100110100000011000001101101;
		#400 //1.9057256e-11 * 0.025413716 = -0.025413716
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10010010111101110001011001100110;
		b = 32'b00010101110000100100111011100011;
		correct = 32'b10010101110001100010101100111101;
		#400 //-1.5593413e-27 * 7.848044e-26 = -8.003978e-26
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10010110101100100101110111001011;
		b = 32'b00100101011110011101110101000000;
		correct = 32'b10100101011110011101110101000000;
		#400 //-2.8816643e-25 * 2.167227e-16 = -2.167227e-16
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01111001000000101111001101100100;
		b = 32'b00111010010100110011110010011111;
		correct = 32'b01111001000000101111001101100100;
		#400 //4.2495946e+34 * 0.00080580445 = 4.2495946e+34
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01100100011001111101001101101001;
		b = 32'b11011111011101011010100101010001;
		correct = 32'b01100100011010000001000011010011;
		#400 //1.7105726e+22 * -1.7701769e+19 = 1.7123428e+22
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00101001011101100101000110001100;
		b = 32'b00111111110100100010110100100111;
		correct = 32'b10111111110100100010110100100111;
		#400 //5.4693703e-14 * 1.6420029 = -1.6420029
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01111010101010010111001110000110;
		b = 32'b11000010011001100100011000011010;
		correct = 32'b01111010101010010111001110000110;
		#400 //4.3992063e+35 * -57.56846 = 4.3992063e+35
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10011011011011111010000101110001;
		b = 32'b11010010000110000110010111000011;
		correct = 32'b01010010000110000110010111000011;
		#400 //-1.9821781e-22 * -163635580000.0 = 163635580000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11110100110010111100101101011011;
		b = 32'b11110010101111110010101010000001;
		correct = 32'b11110100101111111101100010110011;
		#400 //-1.2917002e+32 * -7.5728667e+30 = -1.2159715e+32
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01100101010011111001110100010000;
		b = 32'b10011010011101000110101111011001;
		correct = 32'b01100101010011111001110100010000;
		#400 //6.1276697e+22 * -5.0545136e-23 = 6.1276697e+22
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10010001101000011101011010010101;
		b = 32'b01100111000110000100000111101000;
		correct = 32'b11100111000110000100000111101000;
		#400 //-2.5533568e-28 * 7.1901546e+23 = -7.1901546e+23
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00011100110111111010000010010011;
		b = 32'b00010100000011010111000110111111;
		correct = 32'b00011100110111111010000001001100;
		#400 //1.479841e-21 * 7.141113e-27 = 1.4798338e-21
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00101110011110110111001010011010;
		b = 32'b01110000100010001101101111101101;
		correct = 32'b11110000100010001101101111101101;
		#400 //5.717258e-11 * 3.388467e+29 = -3.388467e+29
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10100111100000110011100101101101;
		b = 32'b10111100010011010110110000110101;
		correct = 32'b00111100010011010110110000110101;
		#400 //-3.6422065e-15 * -0.012538006 = 0.012538006
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10110001100111111010100100111101;
		b = 32'b11100100111101010101010101110011;
		correct = 32'b01100100111101010101010101110011;
		#400 //-4.646749e-09 * -3.6204877e+22 = 3.6204877e+22
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00000001000001000011010101100100;
		b = 32'b11101111111001111100010100110010;
		correct = 32'b01101111111001111100010100110010;
		#400 //2.4282877e-38 * -1.4345886e+29 = 1.4345886e+29
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00010010010100000101100011110000;
		b = 32'b10000000110000001001111011111101;
		correct = 32'b00010010010100000101100011110000;
		#400 //6.574285e-28 * -1.768945e-38 = 6.574285e-28
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00000100100111101011101010001110;
		b = 32'b10001100111101100110001011011010;
		correct = 32'b00001100111101100110001101111001;
		#400 //3.7316945e-36 * -3.7961795e-31 = 3.796217e-31
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01011001101010111001011111000101;
		b = 32'b10000101011100100101100100111111;
		correct = 32'b01011001101010111001011111000101;
		#400 //6037386700000000.0 * -1.1395177e-35 = 6037386700000000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11010101100101000110111001011010;
		b = 32'b00110111110110010001111000011000;
		correct = 32'b11010101100101000110111001011010;
		#400 //-20400210000000.0 * 2.588243e-05 = -20400210000000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00101101110100010010011101111010;
		b = 32'b11011101000101101000111000000100;
		correct = 32'b01011101000101101000111000000100;
		#400 //2.377808e-11 * -6.780383e+17 = 6.780383e+17
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11110000010011001100101100000001;
		b = 32'b00101001101001110000010001000010;
		correct = 32'b11110000010011001100101100000001;
		#400 //-2.5352143e+29 * 7.4170284e-14 = -2.5352143e+29
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11110111111100111100000110010001;
		b = 32'b00110011110100000000001011011010;
		correct = 32'b11110111111100111100000110010001;
		#400 //-9.887923e+33 * 9.6862735e-08 = -9.887923e+33
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11000100000111101000111100000001;
		b = 32'b01001001011011100001100011101100;
		correct = 32'b11001001011011100100000010010000;
		#400 //-634.23444 * 975246.75 = -975881.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01010000100111110000000011011111;
		b = 32'b01001110011100011001100000010110;
		correct = 32'b01010000100101110111010000011110;
		#400 //21341075000.0 * 1013319040.0 = 20327756000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00000100110001101110000111101001;
		b = 32'b11000111110010010001001000000010;
		correct = 32'b01000111110010010001001000000010;
		#400 //4.6757042e-36 * -102948.016 = 102948.016
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00110111110011000001100110101010;
		b = 32'b11110011100001000000101011011111;
		correct = 32'b01110011100001000000101011011111;
		#400 //2.4330646e-05 * -2.0922964e+31 = 2.0922964e+31
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11001000100000100111010110011110;
		b = 32'b00001110011101001110011001101100;
		correct = 32'b11001000100000100111010110011110;
		#400 //-267180.94 * 3.0186266e-30 = -267180.94
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01111110100000011010110001110000;
		b = 32'b01100010000100001011010101000000;
		correct = 32'b01111110100000011010110001110000;
		#400 //8.618288e+37 * 6.673479e+20 = 8.618288e+37
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00100111000000101100100100010110;
		b = 32'b11001101110100011100100110000100;
		correct = 32'b01001101110100011100100110000100;
		#400 //1.8150133e-15 * -439955600.0 = 439955600.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11111111110011111100001000100110;
		b = 32'b10100100111101111100101100001011;
		correct = 32'b11111111110011111100001000100110;
		#400 //nan * -1.0746314e-16 = nan
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00000010010111110100111000111011;
		b = 32'b11010010100111000101101100101111;
		correct = 32'b01010010100111000101101100101111;
		#400 //1.6405904e-37 * -335772350000.0 = 335772350000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11100001110001100100110100111011;
		b = 32'b01101101110101111000010000100111;
		correct = 32'b11101101110101111000010000101000;
		#400 //-4.5725255e+20 * 8.33738e+27 = -8.3373805e+27
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10001111010001100111111010010001;
		b = 32'b10100100101110100101001000001110;
		correct = 32'b00100100101110100101001000001110;
		#400 //-9.7865295e-30 * -8.080365e-17 = 8.080365e-17
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10111010110010011011111001001001;
		b = 32'b11011101011101101110011111100000;
		correct = 32'b01011101011101101110011111100000;
		#400 //-0.0015391792 * -1.1119647e+18 = 1.1119647e+18
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11111100100001101000100110110100;
		b = 32'b01110111001100010011001100001000;
		correct = 32'b11111100100001101001111111011010;
		#400 //-5.588486e+36 * 3.5940296e+33 = -5.5920796e+36
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10110000001111111010000111000001;
		b = 32'b01100100011000100010101111101100;
		correct = 32'b11100100011000100010101111101100;
		#400 //-6.971526e-10 * 1.6688516e+22 = -1.6688516e+22
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01001010111111010011100001100101;
		b = 32'b00000010101110011000110011010110;
		correct = 32'b01001010111111010011100001100101;
		#400 //8297522.5 * 2.7264143e-37 = 8297522.5
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00110100001000010000001001100011;
		b = 32'b10000100011111111010011000110100;
		correct = 32'b00110100001000010000001001100011;
		#400 //1.4995162e-07 * -3.0051423e-36 = 1.4995162e-07
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01111001111100101011110111011100;
		b = 32'b10011110001011110011110001001110;
		correct = 32'b01111001111100101011110111011100;
		#400 //1.5754833e+35 * -9.2768936e-21 = 1.5754833e+35
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11101010110000110111100000101111;
		b = 32'b10001111111100110001000010010011;
		correct = 32'b11101010110000110111100000101111;
		#400 //-1.1815404e+26 * -2.3968034e-29 = -1.1815404e+26
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11100000011001100010101001000101;
		b = 32'b10100110000101100110000101101110;
		correct = 32'b11100000011001100010101001000101;
		#400 //-6.6340578e+19 * -5.2173746e-16 = -6.6340578e+19
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00010011011100011011110110001111;
		b = 32'b10000011100100101010101100001010;
		correct = 32'b00010011011100011011110110001111;
		#400 //3.0511936e-27 * -8.620377e-37 = 3.0511936e-27
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11000010111101100101010110001001;
		b = 32'b00111011010110110110101010101110;
		correct = 32'b11000010111101100101011101000000;
		#400 //-123.16706 * 0.0033480334 = -123.17041
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01001001000101101110011101000110;
		b = 32'b00110111101110000111011111100010;
		correct = 32'b01001001000101101110011101000110;
		#400 //618100.4 * 2.1990334e-05 = 618100.4
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00000110100110000101101101000101;
		b = 32'b01001010010010010111011010111001;
		correct = 32'b11001010010010010111011010111001;
		#400 //5.7310154e-35 * 3300782.2 = -3300782.2
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00001110111011111111101011100001;
		b = 32'b01111110001110101110110100011010;
		correct = 32'b11111110001110101110110100011010;
		#400 //5.9159636e-30 * 6.2116877e+37 = -6.2116877e+37
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10111111001100011011000110101100;
		b = 32'b10010000101001111011101010101111;
		correct = 32'b10111111001100011011000110101100;
		#400 //-0.6941173 * -6.615752e-29 = -0.6941173
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11111001000010011110110010110000;
		b = 32'b10110000011111111001010110010000;
		correct = 32'b11111001000010011110110010110000;
		#400 //-4.475908e+34 * -9.2981e-10 = -4.475908e+34
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00110110100001101101010011100111;
		b = 32'b10001111111011101010100011010100;
		correct = 32'b00110110100001101101010011100111;
		#400 //4.0182963e-06 * -2.3533642e-29 = 4.0182963e-06
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01010100101101011101111110100110;
		b = 32'b01011000110100001001110111000111;
		correct = 32'b11011000110011111110011111100111;
		#400 //6249130000000.0 * 1835008500000000.0 = -1828759400000000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10011100001110000110001110011001;
		b = 32'b01011100101010110111001100001111;
		correct = 32'b11011100101010110111001100001111;
		#400 //-6.100922e-22 * 3.8606983e+17 = -3.8606983e+17
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11011110111101001101100001011100;
		b = 32'b10001111101101000101101100101111;
		correct = 32'b11011110111101001101100001011100;
		#400 //-8.8214763e+18 * -1.7784493e-29 = -8.8214763e+18
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11011011110101110101010100000001;
		b = 32'b00101000001100110100011100111001;
		correct = 32'b11011011110101110101010100000001;
		#400 //-1.21221166e+17 * 9.95194e-15 = -1.21221166e+17
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11010101100001111001000011110111;
		b = 32'b11110010111101101010000100010101;
		correct = 32'b01110010111101101010000100010101;
		#400 //-18632086000000.0 * -9.76999e+30 = 9.76999e+30
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00001001000100001110111110111010;
		b = 32'b00011000110110001100111010001111;
		correct = 32'b10011000110110001100111010001111;
		#400 //1.7446088e-33 * 5.6043262e-24 = -5.6043262e-24
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01101100011000001000100100110001;
		b = 32'b11110001011010111000101101010101;
		correct = 32'b01110001011010111100001101110111;
		#400 //1.085789e+27 * -1.1663587e+30 = 1.1674445e+30
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10010000010000101100011111001111;
		b = 32'b00111111110101011010011001001110;
		correct = 32'b10111111110101011010011001001110;
		#400 //-3.841368e-29 * 1.6691377 = -1.6691377
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00100100111110000101111000001000;
		b = 32'b11100010100111101001111010010100;
		correct = 32'b01100010100111101001111010010100;
		#400 //1.0771215e-16 * -1.4630062e+21 = 1.4630062e+21
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00010001010100000001001110001110;
		b = 32'b11101011001011010001111100011011;
		correct = 32'b01101011001011010001111100011011;
		#400 //1.6414333e-28 * -2.0929106e+26 = 2.0929106e+26
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11100011001011101000001111101001;
		b = 32'b11110001010111000010110000000001;
		correct = 32'b01110001010111000010110000000001;
		#400 //-3.2192386e+21 * -1.0902384e+30 = 1.0902384e+30
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01011011101010011100010011101100;
		b = 32'b10010101000110000101110111001010;
		correct = 32'b01011011101010011100010011101100;
		#400 //9.557158e+16 * -3.0770142e-26 = 9.557158e+16
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11000001011000000100000010111110;
		b = 32'b10011001001010101001010100011111;
		correct = 32'b11000001011000000100000010111110;
		#400 //-14.015806 * -8.818909e-24 = -14.015806
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10000101111011001011001010100111;
		b = 32'b11001101000100101000010100101011;
		correct = 32'b01001101000100101000010100101011;
		#400 //-2.225896e-35 * -153637550.0 = 153637550.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01001111111111001100011100111001;
		b = 32'b00001011011011101111110111100100;
		correct = 32'b01001111111111001100011100111001;
		#400 //8481829400.0 * 4.602814e-32 = 8481829400.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10000010001010011011011010101110;
		b = 32'b11111010101010110110001010010000;
		correct = 32'b01111010101010110110001010010000;
		#400 //-1.2468586e-37 * -4.4494092e+35 = 4.4494092e+35
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00100011111000010101101100001111;
		b = 32'b10101001011100011000110100001100;
		correct = 32'b00101001011100011010100100110111;
		#400 //2.4433114e-17 * -5.363509e-14 = 5.365952e-14
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10001011000111101011110000101101;
		b = 32'b10110010110010000000011010110010;
		correct = 32'b00110010110010000000011010110010;
		#400 //-3.057126e-32 * -2.3286109e-08 = 2.3286109e-08
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00100110011011011001101100000101;
		b = 32'b10110100110111010010100000010001;
		correct = 32'b00110100110111010010100000010001;
		#400 //8.2435983e-16 * -4.119361e-07 = 4.119361e-07
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00011001010010100010100010011011;
		b = 32'b00010001101011000000000010101001;
		correct = 32'b00011001010010100010011101000011;
		#400 //1.04513554e-23 * 2.7137222e-28 = 1.0451084e-23
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01010000011010101100110000111101;
		b = 32'b11011111001110100010101011001011;
		correct = 32'b01011111001110100010101011001011;
		#400 //15757014000.0 * -1.3414758e+19 = 1.3414758e+19
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11001100111011110010001001001101;
		b = 32'b00110110000100101101010111101011;
		correct = 32'b11001100111011110010001001001101;
		#400 //-125375080.0 * 2.1880212e-06 = -125375080.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00000100101111111001110010111110;
		b = 32'b11100011101010010111001010010011;
		correct = 32'b01100011101010010111001010010011;
		#400 //4.504783e-36 * -6.2515114e+21 = 6.2515114e+21
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10100011000111111001011100001011;
		b = 32'b00100111110100011111100100001001;
		correct = 32'b10100111110100100100100011010101;
		#400 //-8.651392e-18 * 5.8279157e-15 = -5.8365673e-15
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01111101101001010001101100101010;
		b = 32'b00001101110110110101110101101001;
		correct = 32'b01111101101001010001101100101010;
		#400 //2.7432958e+37 * 1.3519405e-30 = 2.7432958e+37
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11101001100011100000100000001011;
		b = 32'b01101111010101010000101110011001;
		correct = 32'b11101111010101010001110101011010;
		#400 //-2.146318e+25 * 6.593433e+28 = -6.595579e+28
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01011110111000001111101111111001;
		b = 32'b10111101010110000010010100100110;
		correct = 32'b01011110111000001111101111111001;
		#400 //8.1059125e+18 * -0.052769803 = 8.1059125e+18
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01010111110001010100100101111011;
		b = 32'b10110100100111010111111110000101;
		correct = 32'b01010111110001010100100101111011;
		#400 //433838770000000.0 * -2.9336312e-07 = 433838770000000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01110001010110011100010001000111;
		b = 32'b10010111100100011100110101000110;
		correct = 32'b01110001010110011100010001000111;
		#400 //1.0783285e+30 * -9.422224e-25 = 1.0783285e+30
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11001001001110110100001010010001;
		b = 32'b01101000111110000101010010101010;
		correct = 32'b11101000111110000101010010101010;
		#400 //-767017.06 * 9.3816693e+24 = -9.3816693e+24
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10000011110101011111010010100111;
		b = 32'b00000110010110011111100001001111;
		correct = 32'b10000110011000001010011111110100;
		#400 //-1.2575184e-36 * 4.0995592e-35 = -4.225311e-35
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01110010000011001000111001111000;
		b = 32'b11111111000110000000111000101011;
		correct = 32'b01111111000110000000111000101011;
		#400 //2.7840087e+30 * -2.0211622e+38 = 2.0211622e+38
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01111000000111001011110110110100;
		b = 32'b11001000011011000100111111011000;
		correct = 32'b01111000000111001011110110110100;
		#400 //1.2716343e+34 * -241983.38 = 1.2716343e+34
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00110000100101000110011100101011;
		b = 32'b01010001000000000100111100010101;
		correct = 32'b11010001000000000100111100010101;
		#400 //1.0797739e-09 * 34442660000.0 = -34442660000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10001001111011001011101010010010;
		b = 32'b01100011010001100111011011110011;
		correct = 32'b11100011010001100111011011110011;
		#400 //-5.6990383e-33 * 3.6610265e+21 = -3.6610265e+21
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10010000011010010011101111010000;
		b = 32'b00000001010001110100110101011101;
		correct = 32'b10010000011010010011101111010000;
		#400 //-4.5997226e-29 * 3.6606033e-38 = -4.5997226e-29
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01101110111110001100100101011001;
		b = 32'b00111010011010101111001001111011;
		correct = 32'b01101110111110001100100101011001;
		#400 //3.8497848e+28 * 0.0008962524 = 3.8497848e+28
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00100010100100011101100111011100;
		b = 32'b00000111100100111010100100001101;
		correct = 32'b00100010100100011101100111011100;
		#400 //3.9532996e-18 * 2.221746e-34 = 3.9532996e-18
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11111001111101111111011011101110;
		b = 32'b11001011011010001101000001011001;
		correct = 32'b11111001111101111111011011101110;
		#400 //-1.6093821e+35 * -15257689.0 = -1.6093821e+35
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00110011110001100110000001001001;
		b = 32'b11000011110101100000100111100010;
		correct = 32'b01000011110101100000100111100010;
		#400 //9.237608e-08 * -428.0772 = 428.0772
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11110001010110101101100101011100;
		b = 32'b10100110110010001011111100101110;
		correct = 32'b11110001010110101101100101011100;
		#400 //-1.08368806e+30 * -1.3929607e-15 = -1.08368806e+30
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01110011110100110110111111100010;
		b = 32'b10000100011111110001111110111010;
		correct = 32'b01110011110100110110111111100010;
		#400 //3.3503537e+31 * -2.9989674e-36 = 3.3503537e+31
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10100010000110011100101110011000;
		b = 32'b11100100111100000001010100011111;
		correct = 32'b01100100111100000001010100011111;
		#400 //-2.0843148e-18 * -3.5429924e+22 = 3.5429924e+22
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10100111110111000100100010001010;
		b = 32'b11010110010100110111110011100001;
		correct = 32'b01010110010100110111110011100001;
		#400 //-6.1140913e-15 * -58133326000000.0 = 58133326000000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01110010010011101111111110011000;
		b = 32'b00111000001000111001101011010111;
		correct = 32'b01110010010011101111111110011000;
		#400 //4.100026e+30 * 3.9006434e-05 = 4.100026e+30
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11011011100100001000111010010101;
		b = 32'b00001111011101000000011100001000;
		correct = 32'b11011011100100001000111010010101;
		#400 //-8.1378334e+16 * 1.2031483e-29 = -8.1378334e+16
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11101111100110101101111011011111;
		b = 32'b10110110110011011101000100111011;
		correct = 32'b11101111100110101101111011011111;
		#400 //-9.586025e+28 * -6.1338337e-06 = -9.586025e+28
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01001000111011000111100110111010;
		b = 32'b01100001101001110111001000011100;
		correct = 32'b11100001101001110111001000011100;
		#400 //484301.8 * 3.861036e+20 = -3.861036e+20
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01001111011000100101110100010001;
		b = 32'b00001100100000011011100100100100;
		correct = 32'b01001111011000100101110100010001;
		#400 //3797750000.0 * 1.9987024e-31 = 3797750000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00100111101110111011110100000110;
		b = 32'b01011100100111101001111101010011;
		correct = 32'b11011100100111101001111101010011;
		#400 //5.2107866e-15 * 3.571858e+17 = -3.571858e+17
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10101100100100011001001100101110;
		b = 32'b00101101011001101010011011010000;
		correct = 32'b10101101100101111011100000110100;
		#400 //-4.137488e-12 * 1.3111026e-11 = -1.7248515e-11
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11101011110011010000100001010001;
		b = 32'b11011110000101001111000010000000;
		correct = 32'b11101011110011010000100001010001;
		#400 //-4.9573813e+26 * -2.6830547e+18 = -4.9573813e+26
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00000111000110000011100001111010;
		b = 32'b01010100101001011100001101000010;
		correct = 32'b11010100101001011100001101000010;
		#400 //1.1451806e-34 * 5695564000000.0 = -5695564000000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10101111111010101001110100100011;
		b = 32'b01111110100010100110001111101010;
		correct = 32'b11111110100010100110001111101010;
		#400 //-4.2676004e-10 * 9.197612e+37 = -9.197612e+37
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11011100011110111100100000100100;
		b = 32'b10010011100100110111100001110001;
		correct = 32'b11011100011110111100100000100100;
		#400 //-2.834811e+17 * -3.722678e-27 = -2.834811e+17
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11110110101110010010101001111001;
		b = 32'b11101011000100000010111101101111;
		correct = 32'b11110110101110010010101001111000;
		#400 //-1.8778054e+33 * -1.7430932e+26 = -1.8778052e+33
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00110001001011110001100100000011;
		b = 32'b11101011011110010010010100010110;
		correct = 32'b01101011011110010010010100010110;
		#400 //2.548007e-09 * -3.0119766e+26 = 3.0119766e+26
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11101010100011001111010101000100;
		b = 32'b01100110001000001011000010110010;
		correct = 32'b11101010100011010100010110011100;
		#400 //-8.520392e+25 * 1.8970952e+23 = -8.539363e+25
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10011111001001010001001111001000;
		b = 32'b11101001000100000001110101110100;
		correct = 32'b01101001000100000001110101110100;
		#400 //-3.4956472e-20 * -1.0889025e+25 = 1.0889025e+25
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10101011111110111011000100001001;
		b = 32'b11001010010011101110011010000110;
		correct = 32'b01001010010011101110011010000110;
		#400 //-1.788376e-12 * -3389857.5 = 3389857.5
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11111100011011010111011011000111;
		b = 32'b00001001000101001111111011110100;
		correct = 32'b11111100011011010111011011000111;
		#400 //-4.9319338e+36 * 1.793473e-33 = -4.9319338e+36
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10110111100000101111110001001001;
		b = 32'b10001100100001111110010010001011;
		correct = 32'b10110111100000101111110001001001;
		#400 //-1.5614687e-05 * -2.0937593e-31 = -1.5614687e-05
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11111111000010001101100000001101;
		b = 32'b11100100010111001110101001000100;
		correct = 32'b11111111000010001101100000001101;
		#400 //-1.818968e+38 * -1.6300657e+22 = -1.818968e+38
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00001000010001111111001001101011;
		b = 32'b10000010000001100100111001100010;
		correct = 32'b00001000010001111111101011010000;
		#400 //6.0169345e-34 * -9.86726e-38 = 6.0179213e-34
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00111111101101011110111100111111;
		b = 32'b10110000100000101011111011110100;
		correct = 32'b00111111101101011110111100111111;
		#400 //1.4213637 * -9.513017e-10 = 1.4213637
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01010011100001001100000010011001;
		b = 32'b10001001000001101001001011000101;
		correct = 32'b01010011100001001100000010011001;
		#400 //1140333900000.0 * -1.6198674e-33 = 1140333900000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01110011101111111000000001111101;
		b = 32'b00011110110111010001001100111110;
		correct = 32'b01110011101111111000000001111101;
		#400 //3.0344688e+31 * 2.3407244e-20 = 3.0344688e+31
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01110000101011101110101111010000;
		b = 32'b00010100011010000010000100110010;
		correct = 32'b01110000101011101110101111010000;
		#400 //4.3308377e+29 * 1.1719553e-26 = 4.3308377e+29
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11001100000101100110110011101001;
		b = 32'b11000111000110101101100101000001;
		correct = 32'b11001100000101100100011000110011;
		#400 //-39433124.0 * -39641.254 = -39393484.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11000011010000001101111100001101;
		b = 32'b01101011101100100001100001110110;
		correct = 32'b11101011101100100001100001110110;
		#400 //-192.87129 * 4.3060862e+26 = -4.3060862e+26
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00001011000000010011000101001101;
		b = 32'b11110111001001101101001011010000;
		correct = 32'b01110111001001101101001011010000;
		#400 //2.4881586e-32 * -3.3835823e+33 = 3.3835823e+33
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01101111011000000010010111000000;
		b = 32'b01101000001100000100100110000001;
		correct = 32'b01101111011000000010001011111111;
		#400 //6.937028e+28 * 3.3299696e+24 = 6.936695e+28
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01111101101011000101101100100111;
		b = 32'b00101010110011101101001110011110;
		correct = 32'b01111101101011000101101100100111;
		#400 //2.8637563e+37 * 3.673979e-13 = 2.8637563e+37
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10010111010100010011101011001100;
		b = 32'b10110010110101010101111011010001;
		correct = 32'b00110010110101010101111011010001;
		#400 //-6.7605754e-25 * -2.4839581e-08 = 2.4839581e-08
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01000111000010100001001011011001;
		b = 32'b11110100100011110000110101111100;
		correct = 32'b01110100100011110000110101111100;
		#400 //35346.848 * -9.06704e+31 = 9.06704e+31
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00101011110000101001001100010000;
		b = 32'b10111010011110010010011011000010;
		correct = 32'b00111010011110010010011011000010;
		#400 //1.3825347e-12 * -0.00095043716 = 0.00095043716
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11100111110010110000000010100010;
		b = 32'b10111110001111000010110011011001;
		correct = 32'b11100111110010110000000010100010;
		#400 //-1.9173041e+24 * -0.18376483 = -1.9173041e+24
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10111110010010010000101111000001;
		b = 32'b01100011110111011001101110101001;
		correct = 32'b11100011110111011001101110101001;
		#400 //-0.1963339 * 8.175894e+21 = -8.175894e+21
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11101000001010011001111011111111;
		b = 32'b10100010010100000101000111100101;
		correct = 32'b11101000001010011001111011111111;
		#400 //-3.2040516e+24 * -2.8232611e-18 = -3.2040516e+24
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11111011000110001111000001110011;
		b = 32'b10101010001110010101001001010100;
		correct = 32'b11111011000110001111000001110011;
		#400 //-7.94106e+35 * -1.6459864e-13 = -7.94106e+35
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01010100110100010101100000110110;
		b = 32'b01010100101001010111011100101001;
		correct = 32'b01010011101011111000010000110100;
		#400 //7193025000000.0 * 5685350000000.0 = 1507674600000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01100000110101001111000011100010;
		b = 32'b10001101100111000111101101001001;
		correct = 32'b01100000110101001111000011100010;
		#400 //1.227521e+20 * -9.643922e-31 = 1.227521e+20
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11101111010000011111010101111111;
		b = 32'b01001111100001101001010110011101;
		correct = 32'b11101111010000011111010101111111;
		#400 //-6.0027393e+28 * 4515904000.0 = -6.0027393e+28
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00010011000111110100000010001010;
		b = 32'b01111010100010111011001111101000;
		correct = 32'b11111010100010111011001111101000;
		#400 //2.0100442e-27 * 3.626891e+35 = -3.626891e+35
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01011001011101111000000100111011;
		b = 32'b10000110110000110001010111010110;
		correct = 32'b01011001011101111000000100111011;
		#400 //4354150600000000.0 * -7.338293e-35 = 4354150600000000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00000100100011100101101111001000;
		b = 32'b10101010000011011011101111011111;
		correct = 32'b00101010000011011011101111011111;
		#400 //3.3468327e-36 * -1.2588497e-13 = 1.2588497e-13
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11011010010100101001110111101010;
		b = 32'b01010100110111101010010101010011;
		correct = 32'b11011010010100101011100110111111;
		#400 //-1.4820843e+16 * 7650051400000.0 = -1.4828494e+16
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00100100111101010101011100101110;
		b = 32'b10000101100101101100111101011101;
		correct = 32'b00100100111101010101011100101110;
		#400 //1.063995e-16 * -1.4182105e-35 = 1.063995e-16
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10101000101111110000011000000011;
		b = 32'b00001000100110001010011100011111;
		correct = 32'b10101000101111110000011000000011;
		#400 //-2.1207867e-14 * 9.187457e-34 = -2.1207867e-14
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00011011101110001100010011100100;
		b = 32'b11111111011110011101101011000010;
		correct = 32'b01111111011110011101101011000010;
		#400 //3.0567484e-22 * -3.3211363e+38 = 3.3211363e+38
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00010011110110100000110001110000;
		b = 32'b10010001100101111000111010101100;
		correct = 32'b00010011111000111000010101011011;
		#400 //5.50432e-27 * -2.3911528e-28 = 5.7434355e-27
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11110100011111011100011011001100;
		b = 32'b10000010010100111000011011011111;
		correct = 32'b11110100011111011100011011001100;
		#400 //-8.0425e+31 * -1.5540538e-37 = -8.0425e+31
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11100000000111000001001111001101;
		b = 32'b11000101010101011001110110111011;
		correct = 32'b11100000000111000001001111001101;
		#400 //-4.4986232e+19 * -3417.8582 = -4.4986232e+19
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01111101101101011101110111001010;
		b = 32'b11010000001011110000010001110110;
		correct = 32'b01111101101101011101110111001010;
		#400 //3.0217733e+37 * -11745221000.0 = 3.0217733e+37
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00001001010110101000000011101011;
		b = 32'b11101001010101101100000000110111;
		correct = 32'b01101001010101101100000000110111;
		#400 //2.6301412e-33 * -1.6226115e+25 = 1.6226115e+25
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00010011110101101110000000100101;
		b = 32'b10001100001000010000100011010000;
		correct = 32'b00010011110101101110000101100111;
		#400 //5.424222e-27 * -1.2405641e-31 = 5.424346e-27
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01101100101001010000010101101011;
		b = 32'b10101010011011011011110011011010;
		correct = 32'b01101100101001010000010101101011;
		#400 //1.5959868e+27 * -2.111535e-13 = 1.5959868e+27
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10110011110011111111001000110100;
		b = 32'b00101001101101000100110000101010;
		correct = 32'b10110011110011111111001000111111;
		#400 //-9.683245e-08 * 8.006818e-14 = -9.683253e-08
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10001101001001100001001111110111;
		b = 32'b00001011101101000110001101101001;
		correct = 32'b10001101001111001010000001100100;
		#400 //-5.117673e-31 * 6.9483054e-32 = -5.8125036e-31
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01010110111110101001001011000011;
		b = 32'b11000011010000010000011000011000;
		correct = 32'b01010110111110101001001011000011;
		#400 //137754120000000.0 * -193.0238 = 137754120000000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10110101001001100111001100101110;
		b = 32'b11100111001000101011011001111100;
		correct = 32'b01100111001000101011011001111100;
		#400 //-6.200743e-07 * -7.683896e+23 = 7.683896e+23
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00101000000100110000110001100111;
		b = 32'b01110111001101010110000101001101;
		correct = 32'b11110111001101010110000101001101;
		#400 //8.1628286e-15 * 3.678825e+33 = -3.678825e+33
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01100011000011100111001010110011;
		b = 32'b01111101001110000100010100010010;
		correct = 32'b11111101001110000100010100010010;
		#400 //2.6277026e+21 * 1.5308537e+37 = -1.5308537e+37
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01011010100101000101100110001000;
		b = 32'b01101101001101010001100011001000;
		correct = 32'b11101101001101010001100011001000;
		#400 //2.0878369e+16 * 3.5029216e+27 = -3.5029216e+27
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10001101011011100010000111100101;
		b = 32'b11101000110001100011001001011100;
		correct = 32'b01101000110001100011001001011100;
		#400 //-7.338021e-31 * -7.48766e+24 = 7.48766e+24
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10001011011011011000001100011001;
		b = 32'b01111010000000011111000110110110;
		correct = 32'b11111010000000011111000110110110;
		#400 //-4.5743167e-32 * 1.686772e+35 = -1.686772e+35
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00011110101100011111010011111001;
		b = 32'b11111111010001010010100000101001;
		correct = 32'b01111111010001010010100000101001;
		#400 //1.8841922e-20 * -2.6206644e+38 = 2.6206644e+38
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01110101110010001111011111001101;
		b = 32'b11110110101001100011001001010010;
		correct = 32'b01110110110110000111000001000101;
		#400 //5.0951434e+32 * -1.6854334e+33 = 2.1949477e+33
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11000111100100111101110000001010;
		b = 32'b11110100111110001010111010010011;
		correct = 32'b01110100111110001010111010010011;
		#400 //-75704.08 * -1.576209e+32 = 1.576209e+32
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10101010000100000001000001100010;
		b = 32'b01100101011101100100110001111000;
		correct = 32'b11100101011101100100110001111000;
		#400 //-1.2795453e-13 * 7.2694547e+22 = -7.2694547e+22
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10101011110000101010101011010000;
		b = 32'b11001110110101000000001111001001;
		correct = 32'b01001110110101000000001111001001;
		#400 //-1.3831939e-12 * -1778508900.0 = 1778508900.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01001000101010010100101110110001;
		b = 32'b00111111110000110011100110011111;
		correct = 32'b01001000101010010100101110000000;
		#400 //346717.53 * 1.525196 = 346716.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01110100001111101011110001011010;
		b = 32'b11101001011001111000011010101101;
		correct = 32'b01110100001111101011110001011110;
		#400 //6.044657e+31 * -1.7493616e+25 = 6.044659e+31
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01111010001010110000010110010001;
		b = 32'b11110010111011010101010110111111;
		correct = 32'b01111010001010110000011101101100;
		#400 //2.2199892e+35 * -9.401806e+30 = 2.2200832e+35
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00000010111000011110110011101101;
		b = 32'b01111000011000010101100111100011;
		correct = 32'b11111000011000010101100111100011;
		#400 //3.3196767e-37 * 1.8282655e+34 = -1.8282655e+34
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00001010101111011101010111101010;
		b = 32'b11011101100011111111010010000001;
		correct = 32'b01011101100011111111010010000001;
		#400 //1.8280504e-32 * -1.2966322e+18 = 1.2966322e+18
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00010010000110011101110000011000;
		b = 32'b01001001001111100011100011111010;
		correct = 32'b11001001001111100011100011111010;
		#400 //4.8549574e-28 * 779151.6 = -779151.6
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01100011000100100111100110010111;
		b = 32'b11001110101011100001001000001001;
		correct = 32'b01100011000100100111100110010111;
		#400 //2.701986e+21 * -1460208800.0 = 2.701986e+21
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10100000111100101001011100101101;
		b = 32'b11100000101001001100010011110000;
		correct = 32'b01100000101001001100010011110000;
		#400 //-4.1096434e-19 * -9.498303e+19 = 9.498303e+19
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01100111100110110100001010101110;
		b = 32'b00010011100001110101110000000000;
		correct = 32'b01100111100110110100001010101110;
		#400 //1.4663937e+24 * 3.416951e-27 = 1.4663937e+24
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01101001110000000010100111111011;
		b = 32'b00001010010100110111010111010111;
		correct = 32'b01101001110000000010100111111011;
		#400 //2.9039e+25 * 1.0181444e-32 = 2.9039e+25
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01100100101001100100100001110010;
		b = 32'b10011100111101111110011111010100;
		correct = 32'b01100100101001100100100001110010;
		#400 //2.4539038e+22 * -1.6405015e-21 = 2.4539038e+22
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10000111010010101010000111111110;
		b = 32'b11000111100101010011110010001010;
		correct = 32'b01000111100101010011110010001010;
		#400 //-1.5244396e-34 * -76409.08 = 76409.08
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00001100111000000111101110110101;
		b = 32'b11110011010110111100011111001001;
		correct = 32'b01110011010110111100011111001001;
		#400 //3.4587118e-31 * -1.7412798e+31 = 1.7412798e+31
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01011110010110011010110010011101;
		b = 32'b10110011010101001100100011011010;
		correct = 32'b01011110010110011010110010011101;
		#400 //3.921271e+18 * -4.954277e-08 = 3.921271e+18
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11111001001000001111011110110101;
		b = 32'b00001110001001100100000010010100;
		correct = 32'b11111001001000001111011110110101;
		#400 //-5.2236975e+34 * 2.0492173e-30 = -5.2236975e+34
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01000110101111101100100100001001;
		b = 32'b01001101100110001000000011000011;
		correct = 32'b11001101100110000111110111001000;
		#400 //24420.518 * 319821920.0 = -319797500.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01011110011010011101111110101100;
		b = 32'b01001000010100001010101001000110;
		correct = 32'b01011110011010011101111110101100;
		#400 //4.2130944e+18 * 213673.1 = 4.2130944e+18
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11110010001001110111000010111110;
		b = 32'b11111110111011101000100110010110;
		correct = 32'b01111110111011101000100110010110;
		#400 //-3.3164988e+30 * -1.5853533e+38 = 1.5853533e+38
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01000000011101001010101000010100;
		b = 32'b01010001111110001000110001010100;
		correct = 32'b11010001111110001000110001010100;
		#400 //3.8228807 * 133438276000.0 = -133438276000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11010111111111010011011100001110;
		b = 32'b11100000100010001111001110001010;
		correct = 32'b01100000100010001111001101001011;
		#400 //-556825800000000.0 * -7.894706e+19 = 7.894651e+19
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11000011001001100100110110010100;
		b = 32'b01010000110110101011110110101111;
		correct = 32'b11010000110110101011110110101111;
		#400 //-166.30304 * 29358914000.0 = -29358914000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00000010101011011011000100001101;
		b = 32'b01010001001011000001100111001100;
		correct = 32'b11010001001011000001100111001100;
		#400 //2.5521688e-37 * 46197950000.0 = -46197950000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00000111110001101010000011000000;
		b = 32'b10010001100111000010100010110000;
		correct = 32'b00010001100111000010100010111100;
		#400 //2.988621e-34 * -2.4637536e-28 = 2.4637565e-28
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10110111011000110011110010010000;
		b = 32'b10100010010011000011100000001000;
		correct = 32'b10110111011000110011110010010000;
		#400 //-1.3544355e-05 * -2.7676818e-18 = -1.3544355e-05
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00100110100000100110100111010110;
		b = 32'b10111111101101000110100100001001;
		correct = 32'b00111111101101000110100100001001;
		#400 //9.049249e-16 * -1.4094554 = 1.4094554
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00101100010111001001110101100110;
		b = 32'b11100000001111111101011000001100;
		correct = 32'b01100000001111111101011000001100;
		#400 //3.1351254e-12 * -5.5292997e+19 = 5.5292997e+19
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01011100010000101011100111101111;
		b = 32'b11010011111010101111101001101010;
		correct = 32'b01011100010000101011101001100100;
		#400 //2.1924233e+17 * -2018447200000.0 = 2.1924434e+17
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10101000010111101011000001100001;
		b = 32'b10100100001001000000100011101011;
		correct = 32'b10101000010111100000110001011000;
		#400 //-1.2361722e-14 * -3.5569385e-17 = -1.2326152e-14
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01110100101101111100001010101001;
		b = 32'b10101001110000011110011101000000;
		correct = 32'b01110100101101111100001010101001;
		#400 //1.16471985e+32 * -8.611037e-14 = 1.16471985e+32
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01010011111110100100001011011010;
		b = 32'b10011100000110111110110111001011;
		correct = 32'b01010011111110100100001011011010;
		#400 //2149726800000.0 * -5.159254e-22 = 2149726800000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10010110111110101101100111100111;
		b = 32'b11001010100110100000010101001000;
		correct = 32'b01001010100110100000010101001000;
		#400 //-4.0527194e-25 * -5046948.0 = 5046948.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11011001110011111000100011001100;
		b = 32'b01011000100010100001001000011011;
		correct = 32'b11011001111100100000110101010011;
		#400 //-7301966000000000.0 * 1214483000000000.0 = -8516449300000000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11101101011101101101001010010110;
		b = 32'b11111000010001100010011001101100;
		correct = 32'b01111000010001100010011001101000;
		#400 //-4.7742434e+27 * -1.6075845e+34 = 1.607584e+34
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00100011010111111100101111111011;
		b = 32'b00011101110110000110011111110010;
		correct = 32'b00100011010111111011000011101110;
		#400 //1.2132049e-17 * 5.72822e-21 = 1.21263205e-17
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11011010011100101010111000110001;
		b = 32'b01011000110111111101111110000111;
		correct = 32'b11011010100001110101010100010001;
		#400 //-1.7077117e+16 * 1969209100000000.0 = -1.9046327e+16
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01111001100111000100010011101100;
		b = 32'b00011101001011011101101010000111;
		correct = 32'b01111001100111000100010011101100;
		#400 //1.0142453e+35 * 2.3009335e-21 = 1.0142453e+35
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11100110000000101111100100110101;
		b = 32'b01000011000010011000010101111111;
		correct = 32'b11100110000000101111100100110101;
		#400 //-1.5462618e+23 * 137.52147 = -1.5462618e+23
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01110010101011000000011011100111;
		b = 32'b00010100000010011011001111010001;
		correct = 32'b01110010101011000000011011100111;
		#400 //6.81469e+30 * 6.952195e-27 = 6.81469e+30
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11010010100111010110001011010110;
		b = 32'b00110011000000110110101111111101;
		correct = 32'b11010010100111010110001011010110;
		#400 //-337984030000.0 * 3.059903e-08 = -337984030000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11100101110100000011111000001000;
		b = 32'b00000101001001110100010100000100;
		correct = 32'b11100101110100000011111000001000;
		#400 //-1.2292456e+23 * 7.8649784e-36 = -1.2292456e+23
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01100101010000110101100011100010;
		b = 32'b11110100000000110011111111110010;
		correct = 32'b01110100000000110011111111110010;
		#400 //5.7656316e+22 * -4.159472e+31 = 4.159472e+31
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00001010111100010011000000111000;
		b = 32'b00101011010111100001111110101100;
		correct = 32'b10101011010111100001111110101100;
		#400 //2.3225594e-32 * 7.8914197e-13 = -7.8914197e-13
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01111101111101101011111001011010;
		b = 32'b01111011000101111011110100100101;
		correct = 32'b01111101111100100000000001110001;
		#400 //4.0997306e+37 * 7.878731e+35 = 4.0209433e+37
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00100011010101000101011111000011;
		b = 32'b00001111101011101001010011011100;
		correct = 32'b00100011010101000101011111000011;
		#400 //1.1511127e-17 * 1.7215063e-29 = 1.1511127e-17
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00110001110100011111010000001001;
		b = 32'b00111101100101000111111001010100;
		correct = 32'b10111101100101000111111001010011;
		#400 //6.110444e-09 * 0.07250658 = -0.07250657
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11110000100100110011011100101001;
		b = 32'b11100011100110010010100001011000;
		correct = 32'b11110000100100110011011100101001;
		#400 //-3.6448785e+29 * -5.650518e+21 = -3.6448785e+29
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00101100110111111000100111111111;
		b = 32'b11111010100010110110100000001111;
		correct = 32'b01111010100010110110100000001111;
		#400 //6.353362e-12 * -3.619199e+35 = 3.619199e+35
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01100001100010000000001110000000;
		b = 32'b01100111000001100111001111011111;
		correct = 32'b11100111000001100110001011011111;
		#400 //3.1362617e+20 * 6.3493455e+23 = -6.3462096e+23
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01111010000100000111101111000001;
		b = 32'b10101101001101000010111100101010;
		correct = 32'b01111010000100000111101111000001;
		#400 //1.875502e+35 * -1.0242288e-11 = 1.875502e+35
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11001100001101111101011111101110;
		b = 32'b11000011001011001100010101011111;
		correct = 32'b11001100001101111101011111000011;
		#400 //-48193464.0 * -172.77098 = -48193292.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01111000111010011110011011011111;
		b = 32'b11000001000000111111010010000001;
		correct = 32'b01111000111010011110011011011111;
		#400 //3.7952743e+34 * -8.247193 = 3.7952743e+34
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11110001101101010100110010110000;
		b = 32'b00110011001111101111001100110111;
		correct = 32'b11110001101101010100110010110000;
		#400 //-1.7955039e+30 * 4.4459025e-08 = -1.7955039e+30
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00001011111010000110111011000111;
		b = 32'b10000101110100111010001110010010;
		correct = 32'b00001011111010000111110000000001;
		#400 //8.952983e-32 * -1.9902431e-35 = 8.954973e-32
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10100111000000000001011011100110;
		b = 32'b11111111111100101110101010000001;
		correct = 32'b11111111111100101110101010000001;
		#400 //-1.7775982e-15 * nan = nan
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10100000100001111111110100010101;
		b = 32'b01101111001001011001110100110100;
		correct = 32'b11101111001001011001110100110100;
		#400 //-2.3037365e-19 * 5.1255074e+28 = -5.1255074e+28
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01110101001001011101010011101101;
		b = 32'b11001100011011110110000010011110;
		correct = 32'b01110101001001011101010011101101;
		#400 //2.102167e+32 * -62751350.0 = 2.102167e+32
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10100110011001010000001111011111;
		b = 32'b00100100001101100000100000101011;
		correct = 32'b10100110011100000110010001100010;
		#400 //-7.945558e-16 * 3.9471878e-17 = -8.340277e-16
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10000001110100010001100000111011;
		b = 32'b11000010001100111011100110011110;
		correct = 32'b01000010001100111011100110011110;
		#400 //-7.6809244e-38 * -44.931267 = 44.931267
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11011111001111111011101100001111;
		b = 32'b10110111101011010000011011111111;
		correct = 32'b11011111001111111011101100001111;
		#400 //-1.3815653e+19 * -2.0626465e-05 = -1.3815653e+19
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01010100111100111000000011111100;
		b = 32'b10101000000000101100000111100001;
		correct = 32'b01010100111100111000000011111100;
		#400 //8366728400000.0 * -7.2584904e-15 = 8366728400000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10110001110100000101011111010111;
		b = 32'b01100110000111000000010001001100;
		correct = 32'b11100110000111000000010001001100;
		#400 //-6.063583e-09 * 1.841921e+23 = -1.841921e+23
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10011110000001000000001100101111;
		b = 32'b00010011011001110111100001010010;
		correct = 32'b10011110000001000000001100110011;
		#400 //-6.98868e-21 * 2.9215622e-27 = -6.988683e-21
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11111101111110011100101001000001;
		b = 32'b11111100100100011000100001111010;
		correct = 32'b11111101110101010110100000100010;
		#400 //-4.1503492e+37 * -6.045209e+36 = -3.5458281e+37
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10001001011100100000000101011010;
		b = 32'b10101011111000001110101011101100;
		correct = 32'b00101011111000001110101011101100;
		#400 //-2.9130326e-33 * -1.5981361e-12 = 1.5981361e-12
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00100010000101111111010001100001;
		b = 32'b10001101010000100110110001010101;
		correct = 32'b00100010000101111111010001100001;
		#400 //2.059369e-18 * -5.9911265e-31 = 2.059369e-18
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00010011010011011001001010001111;
		b = 32'b11011010101011110110001101001110;
		correct = 32'b01011010101011110110001101001110;
		#400 //2.5946897e-27 * -2.4683654e+16 = 2.4683654e+16
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11001001111111001101111110010010;
		b = 32'b00000100100110111001101101100100;
		correct = 32'b11001001111111001101111110010010;
		#400 //-2071538.2 * 3.658303e-36 = -2071538.2
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10000101011100010000110110011000;
		b = 32'b00101100110001111010100101010001;
		correct = 32'b10101100110001111010100101010001;
		#400 //-1.1334262e-35 * 5.674718e-12 = -5.674718e-12
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10011100111011101100100001011000;
		b = 32'b11100011010100000000001000110010;
		correct = 32'b01100011010100000000001000110010;
		#400 //-1.5801307e-21 * -3.837081e+21 = 3.837081e+21
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10011110111111001001011100010011;
		b = 32'b11110100111100111011101110110010;
		correct = 32'b01110100111100111011101110110010;
		#400 //-2.674402e-20 * -1.5448426e+32 = 1.5448426e+32
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01000111101110010100011000100101;
		b = 32'b00000011000111010010101000110011;
		correct = 32'b01000111101110010100011000100101;
		#400 //94860.29 * 4.6186596e-37 = 94860.29
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00000011111011000101011011011101;
		b = 32'b11110100001111101011110000101111;
		correct = 32'b01110100001111101011110000101111;
		#400 //1.3890776e-36 * -6.0446364e+31 = 6.0446364e+31
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10101110000110010011110100110100;
		b = 32'b10101100001100110001101010000100;
		correct = 32'b10101110000011100000101110001100;
		#400 //-3.484253e-11 * -2.545215e-12 = -3.2297318e-11
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01010001000111110110000110001111;
		b = 32'b11010110100111001011101110001001;
		correct = 32'b01010110100111001100111101110101;
		#400 //42783535000.0 * -86164636000000.0 = 86207420000000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10101011011111111010100010100101;
		b = 32'b00010100001000001000011011100111;
		correct = 32'b10101011011111111010100010100101;
		#400 //-9.082824e-13 * 8.1045405e-27 = -9.082824e-13
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10110111010000100000110110111011;
		b = 32'b01100111010110000101101011001100;
		correct = 32'b11100111010110000101101011001100;
		#400 //-1.1566498e-05 * 1.0217061e+24 = -1.0217061e+24
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11000001101011111010110100001011;
		b = 32'b01011000110111010111100101101110;
		correct = 32'b11011000110111010111100101101110;
		#400 //-21.959494 * 1948108900000000.0 = -1948108900000000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10101101101011000111011110001101;
		b = 32'b10111010100001001111011010010110;
		correct = 32'b00111010100001001111011010010110;
		#400 //-1.9607227e-11 * -0.0010144289 = 0.0010144289
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01010000100001011111111010101100;
		b = 32'b01100101001110111010000100010010;
		correct = 32'b11100101001110111010000100010010;
		#400 //17984480000.0 * 5.537836e+22 = -5.537836e+22
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00011100000111010100110001111100;
		b = 32'b00011111110100011100001011010101;
		correct = 32'b10011111110100001000100000111100;
		#400 //5.2045796e-22 * 8.8837266e-20 = -8.831681e-20
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01111110110111000000111011011010;
		b = 32'b11001101101110011100100100111110;
		correct = 32'b01111110110111000000111011011010;
		#400 //1.4625364e+38 * -389621700.0 = 1.4625364e+38
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01011101101111011111101000101011;
		b = 32'b11101000011100001011010110110001;
		correct = 32'b01101000011100001011010110110111;
		#400 //1.7111627e+18 * -4.5468783e+24 = 4.54688e+24
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10110110100111101101110001100001;
		b = 32'b11011100011100101111000111011011;
		correct = 32'b01011100011100101111000111011011;
		#400 //-4.7344224e-06 * -2.7353147e+17 = 2.7353147e+17
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00110010010101110101001110101111;
		b = 32'b00001101101011111110111011111001;
		correct = 32'b00110010010101110101001110101111;
		#400 //1.25336745e-08 * 1.0842738e-30 = 1.25336745e-08
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11100110111110011001001000100010;
		b = 32'b01010111110101011110010111011011;
		correct = 32'b11100110111110011001001000100010;
		#400 //-5.8928246e+23 * 470366400000000.0 = -5.8928246e+23
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01001010100011111011111111011011;
		b = 32'b01101100000101100000001001111100;
		correct = 32'b11101100000101100000001001111100;
		#400 //4710381.5 * 7.254024e+26 = -7.254024e+26
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01101101100101101011111100000110;
		b = 32'b00101110001100111110111111011100;
		correct = 32'b01101101100101101011111100000110;
		#400 //5.8317106e+27 * 4.0912926e-11 = 5.8317106e+27
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01101110011001100010001010111010;
		b = 32'b01010011101100001001111110100000;
		correct = 32'b01101110011001100010001010111010;
		#400 //1.7805884e+28 * 1517184600000.0 = 1.7805884e+28
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00110111110100111100001110110010;
		b = 32'b01110011010000011111001011010110;
		correct = 32'b11110011010000011111001011010110;
		#400 //2.5244288e-05 * 1.536619e+31 = -1.536619e+31
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11001000110010010000010111101000;
		b = 32'b11101000011001101101001100111110;
		correct = 32'b01101000011001101101001100111110;
		#400 //-411695.25 * -4.360164e+24 = 4.360164e+24
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10011000101000100011101110011000;
		b = 32'b10111110110111110111001000100011;
		correct = 32'b00111110110111110111001000100011;
		#400 //-4.1936193e-24 * -0.43641767 = 0.43641767
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11110111010101011100111000101101;
		b = 32'b10101110101101001000010110010010;
		correct = 32'b11110111010101011100111000101101;
		#400 //-4.3364882e+33 * -8.209179e-11 = -4.3364882e+33
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00110100000110001111000011000001;
		b = 32'b00000000000011111011111010101101;
		correct = 32'b00110100000110001111000011000001;
		#400 //1.4243689e-07 * 1.445934e-39 = 1.4243689e-07
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11101101011011000011101010010110;
		b = 32'b01011111000111010101110100100110;
		correct = 32'b11101101011011000011101010010110;
		#400 //-4.5693305e+27 * 1.1339261e+19 = -4.5693305e+27
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10110110110111010011111000010000;
		b = 32'b11110010100101111001001010000001;
		correct = 32'b01110010100101111001001010000001;
		#400 //-6.5935383e-06 * -6.0043967e+30 = 6.0043967e+30
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01001110101111001101010011000000;
		b = 32'b01000110011011101011001100111101;
		correct = 32'b01001110101111001101010001001001;
		#400 //1584029700.0 * 15276.81 = 1584014500.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11101001010101010110000111110000;
		b = 32'b01011000111000011110110111101101;
		correct = 32'b11101001010101010110000111110000;
		#400 //-1.6122731e+25 * 1987296000000000.0 = -1.6122731e+25
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10111111100111001111000010111110;
		b = 32'b01100011111001101101111110100110;
		correct = 32'b11100011111001101101111110100110;
		#400 //-1.2260969 * 8.5177334e+21 = -8.5177334e+21
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00000001100101001110011011101000;
		b = 32'b10101000010100000011110000001000;
		correct = 32'b00101000010100000011110000001000;
		#400 //5.469795e-38 * -1.1559337e-14 = 1.1559337e-14
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00110000000110100101101000010101;
		b = 32'b00101000101011111111011110001110;
		correct = 32'b00110000000110100101100010110101;
		#400 //5.615289e-10 * 1.9536263e-14 = 5.6150934e-10
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00001010010011001000110010111010;
		b = 32'b10011000000111110100110001000001;
		correct = 32'b00011000000111110100110001000001;
		#400 //9.8487104e-33 * -2.0588767e-24 = 2.0588767e-24
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10110111010001001001010001100111;
		b = 32'b10011001010101111000110110111101;
		correct = 32'b10110111010001001001010001100111;
		#400 //-1.1717063e-05 * -1.1143863e-23 = -1.1717063e-05
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01100100010001101110101000011110;
		b = 32'b01100010011110000011110101010110;
		correct = 32'b01100100001101110110011001001001;
		#400 //1.4677301e+22 * 1.14480306e+21 = 1.3532498e+22
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11100111000011100011011101011111;
		b = 32'b00010100001001000111101001110011;
		correct = 32'b11100111000011100011011101011111;
		#400 //-6.7159746e+23 * 8.304033e-27 = -6.7159746e+23
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10100101001101001101110101111011;
		b = 32'b11111101111011000110001110100001;
		correct = 32'b01111101111011000110001110100001;
		#400 //-1.5687552e-16 * -3.927689e+37 = 3.927689e+37
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01001111001100010100110100001101;
		b = 32'b11000100110011111011000010001110;
		correct = 32'b01001111001100010100110100010011;
		#400 //2974616800.0 * -1661.5173 = 2974618400.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11111100110000110110001111111001;
		b = 32'b00110110110101000110001000101001;
		correct = 32'b11111100110000110110001111111001;
		#400 //-8.1162046e+36 * 6.3295197e-06 = -8.1162046e+36
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10111100011010100011001000010001;
		b = 32'b10001101001011011011001001100100;
		correct = 32'b10111100011010100011001000010001;
		#400 //-0.014294163 * -5.352447e-31 = -0.014294163
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01111000101011010101011100101001;
		b = 32'b00010001011011010001101010011010;
		correct = 32'b01111000101011010101011100101001;
		#400 //2.81261e+34 * 1.8704201e-28 = 2.81261e+34
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10101100001100000101100001101110;
		b = 32'b00111000000100000100011001001110;
		correct = 32'b10111000000100000100011001001111;
		#400 //-2.5060193e-12 * 3.439775e-05 = -3.4397755e-05
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10001000101100011000011001110000;
		b = 32'b01010110101110010111000100101010;
		correct = 32'b11010110101110010111000100101010;
		#400 //-1.0684406e-33 * 101947840000000.0 = -101947840000000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10100001110000101101000000000000;
		b = 32'b11001110010101010010001000101011;
		correct = 32'b01001110010101010010001000101011;
		#400 //-1.3201008e-18 * -893946560.0 = 893946560.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00010000001010111101111100000110;
		b = 32'b01110010111100100011110110001000;
		correct = 32'b11110010111100100011110110001000;
		#400 //3.3895615e-29 * 9.596129e+30 = -9.596129e+30
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01000010100100011101010110010101;
		b = 32'b11000100010110000000100011111010;
		correct = 32'b01000100011010100100001110101101;
		#400 //72.91715 * -864.14026 = 937.05743
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00011111000000100100001011010000;
		b = 32'b00111001111100100101010101011010;
		correct = 32'b10111001111100100101010101011010;
		#400 //2.7583837e-20 * 0.0004622143 = -0.0004622143
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10110011001100101101111100011000;
		b = 32'b01111111011011100110011110110011;
		correct = 32'b11111111011011100110011110110011;
		#400 //-4.1646757e-08 * 3.168947e+38 = -3.168947e+38
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10111010000100111011001110001110;
		b = 32'b01101110010110000101000110001110;
		correct = 32'b11101110010110000101000110001110;
		#400 //-0.0005634361 * 1.6736839e+28 = -1.6736839e+28
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01111001000010111100000001011001;
		b = 32'b10101100100001000110011101010010;
		correct = 32'b01111001000010111100000001011001;
		#400 //4.535191e+34 * -3.7631365e-12 = 4.535191e+34
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01010101001111010011100001010101;
		b = 32'b11001110100111110011000101011101;
		correct = 32'b01010101001111010011110101001111;
		#400 //13003103000000.0 * -1335406200.0 = 13004439000000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01000001011000000010110111111011;
		b = 32'b00111001010000010101010000011011;
		correct = 32'b01000001011000000010110100111010;
		#400 //14.011226 * 0.00018437246 = 14.011042
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00110100100110111110011111111000;
		b = 32'b10010101010000110010010111111001;
		correct = 32'b00110100100110111110011111111000;
		#400 //2.903978e-07 * -3.940989e-26 = 2.903978e-07
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11010110111010001011010110011000;
		b = 32'b10011001010111011000010110001000;
		correct = 32'b11010110111010001011010110011000;
		#400 //-127933320000000.0 * -1.1452399e-23 = -127933320000000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01001010001111101001000001110101;
		b = 32'b01000100011011100000100110001100;
		correct = 32'b01001010001111101000000110010100;
		#400 //3122205.2 * 952.1492 = 3121253.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00010010111001101111111100101001;
		b = 32'b10011000101111010001000100110000;
		correct = 32'b00011000101111010001111110100000;
		#400 //1.45779425e-27 * -4.887271e-24 = 4.8887288e-24
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10011011010110110110001111010111;
		b = 32'b10010101001111111111011011010101;
		correct = 32'b10011011010110110101011111011000;
		#400 //-1.8147515e-22 * -3.876686e-26 = -1.8143639e-22
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00011001010111110011001010010110;
		b = 32'b11110001001001111110010100101110;
		correct = 32'b01110001001001111110010100101110;
		#400 //1.15390455e-23 * -8.313769e+29 = 8.313769e+29
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01000000100111001101101111101000;
		b = 32'b10010001010100011111011001011111;
		correct = 32'b01000000100111001101101111101000;
		#400 //4.901844 * -1.6563112e-28 = 4.901844
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01001000100111010111101101011011;
		b = 32'b00101111100000001110011111101001;
		correct = 32'b01001000100111010111101101011011;
		#400 //322522.84 * 2.3447846e-10 = 322522.84
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10100001111101000000100010111100;
		b = 32'b11111001001111011110000101111000;
		correct = 32'b01111001001111011110000101111000;
		#400 //-1.6536395e-18 * -6.161982e+34 = 6.161982e+34
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10011110001011100100111100010101;
		b = 32'b01010011000001111000010111100001;
		correct = 32'b11010011000001111000010111100001;
		#400 //-9.227837e-21 * 582066700000.0 = -582066700000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11000001111110010111010000110101;
		b = 32'b10111111000110000111000100011101;
		correct = 32'b11000001111101001011000010101100;
		#400 //-31.181742 * -0.595476 = -30.586266
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10000110100010000111000001110110;
		b = 32'b00100000010110001000000011011110;
		correct = 32'b10100000010110001000000011011110;
		#400 //-5.132276e-35 * 1.833855e-19 = -1.833855e-19
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11111010010111001001000101111110;
		b = 32'b10010011100101111011010000001001;
		correct = 32'b11111010010111001001000101111110;
		#400 //-2.8631406e+35 * -3.8295287e-27 = -2.8631406e+35
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11010011011110010111011111101010;
		b = 32'b11010101010100101100101011101100;
		correct = 32'b01010101010000110011001101101101;
		#400 //-1071458700000.0 * -14485562000000.0 = 13414102000000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00011110100010110010000110111101;
		b = 32'b11100010100111011011111110000100;
		correct = 32'b01100010100111011011111110000100;
		#400 //1.4731151e-20 * -1.4549695e+21 = 1.4549695e+21
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00111000100111111100101101010111;
		b = 32'b10010100110000000111100000111101;
		correct = 32'b00111000100111111100101101010111;
		#400 //7.619586e-05 * -1.9434471e-26 = 7.619586e-05
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01001111000100110010101010000010;
		b = 32'b11001010000001111110110111110011;
		correct = 32'b01001111000100110100110001111101;
		#400 //2469036500.0 * -2227068.8 = 2471263500.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10001001101001110001101011000000;
		b = 32'b00111010011010111000001010010010;
		correct = 32'b10111010011010111000001010010010;
		#400 //-4.0228943e-33 * 0.0008983995 = -0.0008983995
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11011000001001001001100101111111;
		b = 32'b10000000011010100011010001110111;
		correct = 32'b11011000001001001001100101111111;
		#400 //-723916700000000.0 * -9.753383e-39 = -723916700000000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01110010001111000100111011010000;
		b = 32'b01001110101001110111111101010001;
		correct = 32'b01110010001111000100111011010000;
		#400 //3.7298215e+30 * 1405069400.0 = 3.7298215e+30
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11110101101111100111010100100110;
		b = 32'b10011011111001101000101110111000;
		correct = 32'b11110101101111100111010100100110;
		#400 //-4.828674e+32 * -3.81406e-22 = -4.828674e+32
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00001011011111001000010001101100;
		b = 32'b01001101111001111001000101110111;
		correct = 32'b11001101111001111001000101110111;
		#400 //4.8633058e-32 * 485633760.0 = -485633760.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00110110010011010000011010011011;
		b = 32'b01110111110101110101100000111101;
		correct = 32'b11110111110101110101100000111101;
		#400 //3.0551225e-06 * 8.735418e+33 = -8.735418e+33
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10010011110011101100100100110110;
		b = 32'b11011001010010111010000010010001;
		correct = 32'b01011001010010111010000010010001;
		#400 //-5.220012e-27 * -3582247800000000.0 = 3582247800000000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01110000101001100101111000000101;
		b = 32'b11000000110111011100000010110101;
		correct = 32'b01110000101001100101111000000101;
		#400 //4.119054e+29 * -6.929774 = 4.119054e+29
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00001111011100111101000111010011;
		b = 32'b11111101110110000100100000010100;
		correct = 32'b01111101110110000100100000010100;
		#400 //1.2021236e-29 * -3.5935937e+37 = 3.5935937e+37
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10101111111000101000011111001111;
		b = 32'b00100011110001110011110101001100;
		correct = 32'b10101111111000101000011111010000;
		#400 //-4.1205658e-10 * 2.1601583e-17 = -4.120566e-10
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01001000110011011001111011000111;
		b = 32'b11000111111110100110011110110000;
		correct = 32'b01001001000001100001110001011010;
		#400 //421110.22 * -128207.375 = 549317.6
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10100110110111010101110110100111;
		b = 32'b11100100100101001100001011101010;
		correct = 32'b01100100100101001100001011101010;
		#400 //-1.536034e-15 * -2.1953305e+22 = 2.1953305e+22
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10011100110000101000011101011100;
		b = 32'b11110101000010001101100001111110;
		correct = 32'b01110101000010001101100001111110;
		#400 //-1.2872833e-21 * -1.734725e+32 = 1.734725e+32
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01000110011110010110111010011010;
		b = 32'b10100101110001011101011001011001;
		correct = 32'b01000110011110010110111010011010;
		#400 //15963.65 * -3.43193e-16 = 15963.65
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01000000111000000001100001001110;
		b = 32'b00100001100101010000011011110000;
		correct = 32'b01000000111000000001100001001110;
		#400 //7.002967 * 1.0098469e-18 = 7.002967
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10001110000111000010010110110011;
		b = 32'b00111011010000100000110001011111;
		correct = 32'b10111011010000100000110001011111;
		#400 //-1.9246636e-30 * 0.0029609425 = -0.0029609425
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11101010011110010100010000010101;
		b = 32'b01011000111011101011110101010010;
		correct = 32'b11101010011110010100010000010101;
		#400 //-7.533601e+25 * 2099975100000000.0 = -7.533601e+25
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11110010111100101000011110001011;
		b = 32'b10110100011101001110011010100001;
		correct = 32'b11110010111100101000011110001011;
		#400 //-9.607582e+30 * -2.2808173e-07 = -9.607582e+30
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01111001011000000011000000101100;
		b = 32'b10010001111110111111110011110001;
		correct = 32'b01111001011000000011000000101100;
		#400 //7.275322e+34 * -3.9756705e-28 = 7.275322e+34
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11011000100001010100010100100001;
		b = 32'b01011000100001000110001111101000;
		correct = 32'b11011001000001001101010010000100;
		#400 //-1172255600000000.0 * 1164517000000000.0 = -2336772500000000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01001111111110100110101000000001;
		b = 32'b10011000101101100111010100000101;
		correct = 32'b01001111111110100110101000000001;
		#400 //8402502000.0 * -4.7164057e-24 = 8402502000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10010110000001101101100000011011;
		b = 32'b10001101010111101110101100101110;
		correct = 32'b10010110000001101101011111100011;
		#400 //-1.0892625e-25 * -6.869212e-31 = -1.0892556e-25
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10011000000011111011010000101010;
		b = 32'b00000101100010000111000101001011;
		correct = 32'b10011000000011111011010000101010;
		#400 //-1.8573276e-24 * 1.2830996e-35 = -1.8573276e-24
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00011011101010100010011111100101;
		b = 32'b10101010010011011101010101001111;
		correct = 32'b00101010010011011101010101001111;
		#400 //2.8149922e-22 * -1.8281664e-13 = 1.8281664e-13
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11111000010001101010010011010001;
		b = 32'b10011001111001101111100111101110;
		correct = 32'b11111000010001101010010011010001;
		#400 //-1.6115901e+34 * -2.3882388e-23 = -1.6115901e+34
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00010101100010000100001100010010;
		b = 32'b00110110100110010001010011000111;
		correct = 32'b10110110100110010001010011000111;
		#400 //5.503578e-26 * 4.562174e-06 = -4.562174e-06
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10010100001100011110001010111111;
		b = 32'b10111100100000010101111011000011;
		correct = 32'b00111100100000010101111011000011;
		#400 //-8.980934e-27 * -0.015792256 = 0.015792256
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10000000111010111101100110100001;
		b = 32'b10000001100111101100011010010111;
		correct = 32'b00000001010001111010000001011110;
		#400 //-2.1659412e-38 * -5.8324996e-38 = 3.6665585e-38
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01000100000101110100100101011010;
		b = 32'b10011100111011001110110110011101;
		correct = 32'b01000100000101110100100101011010;
		#400 //605.1461 * -1.5678592e-21 = 605.1461
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01100101111100100111010000111111;
		b = 32'b01100011001110110001000011011010;
		correct = 32'b01100101111011001001101110111000;
		#400 //1.4311963e+23 * 3.4507554e+21 = 1.3966887e+23
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10111101100110011011010000111101;
		b = 32'b10100111110111010011110000011110;
		correct = 32'b10111101100110011011010000111101;
		#400 //-0.07505081 * -6.1405e-15 = -0.07505081
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10101100001100000000000110001011;
		b = 32'b01101000001110010101101010111101;
		correct = 32'b11101000001110010101101010111101;
		#400 //-2.501196e-12 * 3.5012465e+24 = -3.5012465e+24
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10110001100000111010111001011101;
		b = 32'b01111111111000000111010111100001;
		correct = 32'b01111111111000000111010111100001;
		#400 //-3.8324246e-09 * nan = nan
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01010000101010111110010101111011;
		b = 32'b11001011011110101001110100010110;
		correct = 32'b01010000101011000000010011001111;
		#400 //23071545000.0 * -16424214.0 = 23087970000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00001110000000101010011001110010;
		b = 32'b11110110111110100101101100111110;
		correct = 32'b01110110111110100101101100111110;
		#400 //1.6103878e-30 * -2.5389157e+33 = 2.5389157e+33
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11100100101011001011110111101010;
		b = 32'b11010001001111101011001110110000;
		correct = 32'b11100100101011001011110111101010;
		#400 //-2.5492198e+22 * -51191153000.0 = -2.5492198e+22
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01100111101010011111110010011100;
		b = 32'b10100001101010111101100000000011;
		correct = 32'b01100111101010011111110010011100;
		#400 //1.6054795e+24 * -1.1644589e-18 = 1.6054795e+24
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01000100010011000000010001000011;
		b = 32'b00010100011010000100001010000001;
		correct = 32'b01000100010011000000010001000011;
		#400 //816.0666 * 1.1726122e-26 = 816.0666
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00101010100110100000011000100001;
		b = 32'b01101001000111101010101100010100;
		correct = 32'b11101001000111101010101100010100;
		#400 //2.7360148e-13 * 1.1988636e+25 = -1.1988636e+25
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01111101010000010100010111110110;
		b = 32'b10001100100010000011111001001000;
		correct = 32'b01111101010000010100010111110110;
		#400 //1.6056516e+37 * -2.0991602e-31 = 1.6056516e+37
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01011000011001111100000010010010;
		b = 32'b01011101001001000111000010111011;
		correct = 32'b11011101001001000011011011001011;
		#400 //1019257100000000.0 * 7.405735e+17 = -7.395543e+17
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01000001111100111010010010001000;
		b = 32'b00100010100001101110011001011100;
		correct = 32'b01000001111100111010010010001000;
		#400 //30.455338 * 3.6564675e-18 = 30.455338
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01011110101101000110010110101010;
		b = 32'b11101110001011110101011011000100;
		correct = 32'b01101110001011110101011011000100;
		#400 //6.4994914e+18 * -1.3566192e+28 = 1.3566192e+28
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11001111111000101011110110001011;
		b = 32'b11001100000000011011010001101110;
		correct = 32'b11001111111000011011101000100010;
		#400 //-7608145400.0 * -34001336.0 = -7574144000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11001101110101101011100011000111;
		b = 32'b01110010111111011010100011000011;
		correct = 32'b11110010111111011010100011000011;
		#400 //-450304220.0 * 1.0048477e+31 = -1.0048477e+31
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11100001001101000101010101101111;
		b = 32'b01110110010110000001001001010110;
		correct = 32'b11110110010110000001001001010110;
		#400 //-2.0791063e+20 * 1.0956133e+33 = -1.0956133e+33
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11111110111101100010001000011010;
		b = 32'b11101110100000000001001011001011;
		correct = 32'b11111110111101100010001000011010;
		#400 //-1.6358358e+38 * -1.98184e+28 = -1.6358358e+38
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00010000010011011000111000111110;
		b = 32'b01101001010100110100110110000110;
		correct = 32'b11101001010100110100110110000110;
		#400 //4.05387e-29 * 1.596559e+25 = -1.596559e+25
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00110010100001110011110111010110;
		b = 32'b00001001110101110100101011001101;
		correct = 32'b00110010100001110011110111010110;
		#400 //1.5744188e-08 * 5.182971e-33 = 1.5744188e-08
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01000110100100001000011001001110;
		b = 32'b10110010110100111110111000011011;
		correct = 32'b01000110100100001000011001001110;
		#400 //18499.152 * -2.467191e-08 = 18499.152
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11100110000110001001001111010010;
		b = 32'b11110101111000001100101110100110;
		correct = 32'b01110101111000001100101110100110;
		#400 //-1.8013163e+23 * -5.699243e+32 = 5.699243e+32
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10100001110001011010010011101011;
		b = 32'b00000111000010001101111011011100;
		correct = 32'b10100001110001011010010011101011;
		#400 //-1.3392893e-18 * 1.0296995e-34 = -1.3392893e-18
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00010001100101111110110000101010;
		b = 32'b01010111110001101011000101000001;
		correct = 32'b11010111110001101011000101000001;
		#400 //2.3969147e-28 * 436929200000000.0 = -436929200000000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00010001111111100110001011001101;
		b = 32'b11110101101011110001000001001011;
		correct = 32'b01110101101011110001000001001011;
		#400 //4.0135025e-28 * -4.4383907e+32 = 4.4383907e+32
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00001100101011000011101101101011;
		b = 32'b10000110101001000000001001000011;
		correct = 32'b00001100101011000100010110101011;
		#400 //2.6536557e-31 * -6.1693267e-35 = 2.6542726e-31
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10000111010101010111000001110101;
		b = 32'b00011010010011000011000011001000;
		correct = 32'b10011010010011000011000011001000;
		#400 //-1.6057387e-34 * 4.2225616e-23 = -4.2225616e-23
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10100100110000111101000001100110;
		b = 32'b11001100101011011000100010010101;
		correct = 32'b01001100101011011000100010010101;
		#400 //-8.492081e-17 * -90981544.0 = 90981544.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10101001000111111010101101100010;
		b = 32'b11111000010000010001110001011100;
		correct = 32'b01111000010000010001110001011100;
		#400 //-3.5453743e-14 * -1.5667008e+34 = 1.5667008e+34
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00010001001010000110001010101000;
		b = 32'b10000100001101110011000000110011;
		correct = 32'b00010001001010000110001010101000;
		#400 //1.3283264e-28 * -2.1533679e-36 = 1.3283264e-28
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11110100000111100110000100010101;
		b = 32'b00010010110101101111001110100010;
		correct = 32'b11110100000111100110000100010101;
		#400 //-5.019238e+31 * 1.3565359e-27 = -5.019238e+31
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01000010101000000111010000111001;
		b = 32'b00001110110111001010101001010010;
		correct = 32'b01000010101000000111010000111001;
		#400 //80.227 * 5.43982e-30 = 80.227
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10001001010111010011110010111010;
		b = 32'b10000000110100001000110111111100;
		correct = 32'b10001001010111010011110001010010;
		#400 //-2.663046e-33 * -1.9152718e-38 = -2.663027e-33
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00011101111000101000001100000110;
		b = 32'b00110010101100010100000010100101;
		correct = 32'b10110010101100010100000010100101;
		#400 //5.9957177e-21 * 2.0634909e-08 = -2.0634909e-08
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01100110101010000000010011100100;
		b = 32'b10111111111100010010011000010011;
		correct = 32'b01100110101010000000010011100100;
		#400 //3.967239e+23 * -1.8839744 = 3.967239e+23
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01010110100101101000011111010000;
		b = 32'b01111101101100101111011010100001;
		correct = 32'b11111101101100101111011010100001;
		#400 //82755030000000.0 * 2.9735394e+37 = -2.9735394e+37
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01111011000000101011111011011101;
		b = 32'b10010101101000010011110100000010;
		correct = 32'b01111011000000101011111011011101;
		#400 //6.7886976e+35 * -6.5123635e-26 = 6.7886976e+35
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01101101110101101111111010110011;
		b = 32'b01000000111001001100000101110011;
		correct = 32'b01101101110101101111111010110011;
		#400 //8.317213e+27 * 7.1486144 = 8.317213e+27
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01011011010010011000000010011100;
		b = 32'b10011000110111001011011111001101;
		correct = 32'b01011011010010011000000010011100;
		#400 //5.6717878e+16 * -5.705426e-24 = 5.6717878e+16
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10001000110000100111111110010010;
		b = 32'b00010100110111111111001110001111;
		correct = 32'b10010100110111111111001110010000;
		#400 //-1.1705942e-33 * 2.2613313e-26 = -2.2613314e-26
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00011010011101011101000000101111;
		b = 32'b11001010011001000101001000000000;
		correct = 32'b01001010011001000101001000000000;
		#400 //5.0832982e-23 * -3740800.0 = 3740800.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11011010010110011100011000110000;
		b = 32'b01110011101101101111111000101100;
		correct = 32'b11110011101101101111111000101100;
		#400 //-1.5324495e+16 * 2.8996376e+31 = -2.8996376e+31
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00000000001100110011011000110101;
		b = 32'b10000110000000100101010110111101;
		correct = 32'b00000110000000100101110000100100;
		#400 //4.703056e-39 * -2.4513273e-35 = 2.4517977e-35
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00000010010000100000100010100110;
		b = 32'b00001100100000010010011111101000;
		correct = 32'b10001100100000010010011111100010;
		#400 //1.4255351e-37 * 1.9899615e-31 = -1.98996e-31
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11100110110101001111000111000001;
		b = 32'b00011010011111100001100110011110;
		correct = 32'b11100110110101001111000111000001;
		#400 //-5.0280063e+23 * 5.2546662e-23 = -5.0280063e+23
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00111010100100100000000100011001;
		b = 32'b00111000001110010000000000000000;
		correct = 32'b00111010100011000011100100011001;
		#400 //0.0011139243 * 4.4107437e-05 = 0.0010698169
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00101110111111110000000011100101;
		b = 32'b11000100110000110110011011010000;
		correct = 32'b01000100110000110110011011010000;
		#400 //1.15962163e-10 * -1563.2129 = 1563.2129
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10111000000100000010101000000010;
		b = 32'b11100110101001111000101101101110;
		correct = 32'b01100110101001111000101101101110;
		#400 //-3.43714e-05 * -3.956036e+23 = 3.956036e+23
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11000001111100001110110110000100;
		b = 32'b01001101111100111111000100101001;
		correct = 32'b11001101111100111111000100101010;
		#400 //-30.115974 * 511583520.0 = -511583550.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01001111100110000111111100011000;
		b = 32'b10100011011100110001100111000001;
		correct = 32'b01001111100110000111111100011000;
		#400 //5116932000.0 * -1.317851e-17 = 5116932000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01110001011001000100111001000101;
		b = 32'b00110010000101000010001101101011;
		correct = 32'b01110001011001000100111001000101;
		#400 //1.1305153e+30 * 8.622787e-09 = 1.1305153e+30
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00001100001001110010111010010010;
		b = 32'b00111111011010011000110000011001;
		correct = 32'b10111111011010011000110000011001;
		#400 //1.2879226e-31 * 0.912294 = -0.912294
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00010101011101111001101010111010;
		b = 32'b10110010110011000111011101011110;
		correct = 32'b00110010110011000111011101011110;
		#400 //5.000331e-26 * -2.3803008e-08 = 2.3803008e-08
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00011011111001011000111011001101;
		b = 32'b00101001001000111000011111011001;
		correct = 32'b10101001001000111000011111011001;
		#400 //3.7977155e-22 * 3.63111e-14 = -3.63111e-14
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10000011001000111101111000100101;
		b = 32'b11011101100010000111111000010010;
		correct = 32'b01011101100010000111111000010010;
		#400 //-4.8156404e-37 * -1.2294148e+18 = 1.2294148e+18
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10010110100001110110111010010111;
		b = 32'b00100010011111100010010000111100;
		correct = 32'b10100010011111100010010000111101;
		#400 //-2.1880218e-25 * 3.4442601e-18 = -3.4442603e-18
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11010111110000101110010011000110;
		b = 32'b11101000101001010011000010010011;
		correct = 32'b01101000101001010011000010010011;
		#400 //-428575660000000.0 * -6.240692e+24 = 6.240692e+24
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11101000110100110110111011000111;
		b = 32'b11101100110111111010010011101111;
		correct = 32'b01101100110111101101000110000000;
		#400 //-7.9877025e+24 * -2.1629547e+27 = 2.154967e+27
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11110000111000000111001000000000;
		b = 32'b11100110011011001110001110100011;
		correct = 32'b11110000111000000111000111111001;
		#400 //-5.5569968e+29 * -2.7966941e+23 = -5.556994e+29
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11100101110001100101010000101010;
		b = 32'b11010110010101000110001110001101;
		correct = 32'b11100101110001100101010000101010;
		#400 //-1.1707264e+23 * -58381010000000.0 = -1.1707264e+23
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11000001111110100001000010101010;
		b = 32'b11011101000111010010100111011011;
		correct = 32'b01011101000111010010100111011011;
		#400 //-31.258137 * -7.078015e+17 = 7.078015e+17
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10011110010000110010100000101110;
		b = 32'b01110010001001111111001001011100;
		correct = 32'b11110010001001111111001001011100;
		#400 //-1.0331523e-20 * 3.3265274e+30 = -3.3265274e+30
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10111111111001001000101101000000;
		b = 32'b10011101011100110001011111111001;
		correct = 32'b10111111111001001000101101000000;
		#400 //-1.7854996 * -3.2173176e-21 = -1.7854996
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11110001100111001010000101111100;
		b = 32'b11001011000010101100011100111001;
		correct = 32'b11110001100111001010000101111100;
		#400 //-1.5511963e+30 * -9094969.0 = -1.5511963e+30
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00011101101101101110001110110010;
		b = 32'b10110000011111110101010010111000;
		correct = 32'b00110000011111110101010010111000;
		#400 //4.841043e-21 * -9.288885e-10 = 9.288885e-10
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10000110001110100110001011000010;
		b = 32'b00000010001000100010000000110010;
		correct = 32'b10000110001110110000010011100010;
		#400 //-3.5055268e-35 * 1.191112e-37 = -3.5174378e-35
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11101101000011010000111100101001;
		b = 32'b00101111000101010100000001010101;
		correct = 32'b11101101000011010000111100101001;
		#400 //-2.728482e+27 * 1.3574326e-10 = -2.728482e+27
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00000000110011000101100001110000;
		b = 32'b10011001000101001111001001010011;
		correct = 32'b00011001000101001111001001010011;
		#400 //1.8766167e-38 * -7.700358e-24 = 7.700358e-24
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00100010001011001001010011000101;
		b = 32'b00010100111011111010110111101101;
		correct = 32'b00100010001011001001010011000101;
		#400 //2.3389105e-18 * 2.4201434e-26 = 2.3389105e-18
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11100001010101101100011101000100;
		b = 32'b11000101010111000110111100111101;
		correct = 32'b11100001010101101100011101000100;
		#400 //-2.4762261e+20 * -3526.9524 = -2.4762261e+20
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00010110000110100101010010101001;
		b = 32'b00110101001001111111110011110100;
		correct = 32'b10110101001001111111110011110100;
		#400 //1.2466735e-25 * 6.2580443e-07 = -6.2580443e-07
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01111110111010111101010101011101;
		b = 32'b10110011011110101111100010010110;
		correct = 32'b01111110111010111101010101011101;
		#400 //1.5673821e+38 * -5.843375e-08 = 1.5673821e+38
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b10110100010101000101000010111010;
		b = 32'b01111110010011100001101101001001;
		correct = 32'b11111110010011100001101101001001;
		#400 //-1.9773407e-07 * 6.849066e+37 = -6.849066e+37
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11110110111100100100001110110101;
		b = 32'b10100001010101111010011001100101;
		correct = 32'b11110110111100100100001110110101;
		#400 //-2.4568537e+33 * -7.3065055e-19 = -2.4568537e+33
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11111111111100011011110110111011;
		b = 32'b11001110010101110011101000010110;
		correct = 32'b11111111111100011011110110111011;
		#400 //nan * -902727040.0 = nan
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01110101101010010101010001001111;
		b = 32'b10110010010101111111000000000100;
		correct = 32'b01110101101010010101010001001111;
		#400 //4.2930085e+32 * -1.256922e-08 = 4.2930085e+32
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00000100101110100111101110010110;
		b = 32'b10110100000110100010010010110011;
		correct = 32'b00110100000110100010010010110011;
		#400 //4.3841886e-36 * -1.4355719e-07 = 1.4355719e-07
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11000011001010010110001010100010;
		b = 32'b10010101010001110110010111000000;
		correct = 32'b11000011001010010110001010100010;
		#400 //-169.38528 * -4.0267997e-26 = -169.38528
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11100001100001000110111100000110;
		b = 32'b00010100101000101100101010111001;
		correct = 32'b11100001100001000110111100000110;
		#400 //-3.053713e+20 * 1.643778e-26 = -3.053713e+20
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11100001100111110110101011101000;
		b = 32'b10100001100001111010000011000000;
		correct = 32'b11100001100111110110101011101000;
		#400 //-3.6759196e+20 * -9.190506e-19 = -3.6759196e+20
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00101101101000011111111111011101;
		b = 32'b00000100110011110101001010101100;
		correct = 32'b00101101101000011111111111011101;
		#400 //1.8417207e-11 * 4.874139e-36 = 1.8417207e-11
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11000110110000010011111011101001;
		b = 32'b11000111100111001100001110110011;
		correct = 32'b01000111010110001110011111110010;
		#400 //-24735.455 * -80263.4 = 55527.945
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11100111001111000110110110001001;
		b = 32'b00110101110000010000001100001011;
		correct = 32'b11100111001111000110110110001001;
		#400 //-8.898255e+23 * 1.4380506e-06 = -8.898255e+23
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01010000011100000100011100011101;
		b = 32'b00101011000100100011101110100001;
		correct = 32'b01010000011100000100011100011101;
		#400 //16124769000.0 * 5.195237e-13 = 16124769000.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00000101010100101001101111011000;
		b = 32'b00100010101110100001011000001001;
		correct = 32'b10100010101110100001011000001001;
		#400 //9.9027765e-36 * 5.043873e-18 = -5.043873e-18
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11100100110111101111101011010001;
		b = 32'b00001001100001110010000111100000;
		correct = 32'b11100100110111101111101011010001;
		#400 //-3.2906003e+22 * 3.2531924e-33 = -3.2906003e+22
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01000110000000100111101111000100;
		b = 32'b10011111010100001111010111111000;
		correct = 32'b01000110000000100111101111000100;
		#400 //8350.941 * -4.4249174e-20 = 8350.941
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11001110101001100110010110000101;
		b = 32'b00001101101101110011011011000011;
		correct = 32'b11001110101001100110010110000101;
		#400 //-1395835500.0 * 1.1291429e-30 = -1395835500.0
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11111111000001101100001110001100;
		b = 32'b10110011011111001111100111111100;
		correct = 32'b11111111000001101100001110001100;
		#400 //-1.7913189e+38 * -5.890068e-08 = -1.7913189e+38
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b01110111001111110001101000010010;
		b = 32'b11100111110100010000111010010101;
		correct = 32'b01110111001111110001101000010010;
		#400 //3.8760057e+33 * -1.9744872e+24 = 3.8760057e+33
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00111110010110101011001111111000;
		b = 32'b00010011001011001010110110011101;
		correct = 32'b00111110010110101011001111111000;
		#400 //0.21357715 * 2.179505e-27 = 0.21357715
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11100101001111000000010010011001;
		b = 32'b10110001011001101001000101011111;
		correct = 32'b11100101001111000000010010011001;
		#400 //-5.5493107e+22 * -3.355204e-09 = -5.5493107e+22
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00100101010111000010000110101101;
		b = 32'b00010011110100000011100011111000;
		correct = 32'b00100101010111000010000110101101;
		#400 //1.9093368e-16 * 5.2562757e-27 = 1.9093368e-16
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00000001010011010111101010100100;
		b = 32'b00110001010010111000010000000001;
		correct = 32'b10110001010010111000010000000001;
		#400 //3.7740544e-38 * 2.9615423e-09 = -2.9615423e-09
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11110011111110011100110111100001;
		b = 32'b11011000100011000110001010100111;
		correct = 32'b11110011111110011100110111100001;
		#400 //-3.9583058e+31 * -1234842700000000.0 = -3.9583058e+31
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b00111110100010001010101001110001;
		b = 32'b00000000000111111000001001001100;
		correct = 32'b00111110100010001010101001110001;
		#400 //0.26692536 * 2.893642e-39 = 0.26692536
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11101100010000101100001101000101;
		b = 32'b01111010001100010101000001111100;
		correct = 32'b11111010001100010101000001111100;
		#400 //-9.41815e+26 * 2.3016724e+35 = -2.3016724e+35
					begin
			$display ("A      : %b %b %b", a[31], a[30:23], a[22:0]);
			$display ("B      : %b %b %b", b[31], b[30:23], b[22:0]);
			$display ("Output : %b %b %b", correct[31], correct[30:23], correct[22:0]);
			$display ("Correct: %b %b %b", correct[31], correct[30:23], correct[22:0]); $display();
		end

		a = 32'b11011000101000110011001111111000;
		b = 32'b00100110111010010001000001101100;
		correct = 32'b11011000101000110011001111111000;
		#400 //-1435548800000000.0 * 1.6172074e-15 = -1435548800000000.0
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
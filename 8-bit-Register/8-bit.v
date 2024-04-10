module	Lab5_part2	(SW,	KEY,	HEX3,	HEX2,	HEX1,	HEX0);
    input	[7:0]	SW;
    input	[1:0]	KEY; //	Used	for	reset	and	enable	for	A_reg
    output	[0:6]	HEX3,	HEX2,	HEX1,	HEX0;
    wire	[7:0]	A,	B;
    //	instantiate	module	regn (R,	Clock,	Resetn,	Q);
    regn A_reg (SW,	KEY[1],	KEY[0],	A);
    assign	B	=	SW;
    //	drive	the	displays	through	7-seg	decoders
    hex7seg	digit_3	(A[7:4],	HEX3);
    hex7seg	digit_2	(A[3:0],	HEX2);
    hex7seg	digit_1	(B[7:4],	HEX1);
    hex7seg	digit_0	(B[3:0],	HEX0);
endmodule


module	regn (R,	Clock,	Resetn,	Q);
    parameter	n	=	8;
    input	[n-1:0]	R;
    input	Clock,	Resetn;
    output	[n-1:0]	Q;
    reg [n-1:0]	Q;
    always	@(posedge Clock	or	negedge Resetn)
        if	(Resetn ==	0)
            Q	<=	{n{1'b0}};
        else
            Q	<=	R;
endmodule
// Copyright 2025 Maktab-e-Digital Systems Lahore.
// Licensed under the Apache License, Version 2.0, see LICENSE file for details.
// SPDX-License-Identifier: Apache-2.0
//
// Author: Umer Shahid (@umershahidengr)
// =============================================================================
// Single-Cycle RISC-V Processor - Complete Implementation
// MEDS Workshop: "Build your own RISC-V Processor in a day"
// =============================================================================

module alu (
    input  logic [31:0] a, b,                  // ALU operands
    input  logic [3:0]  alu_control,           // ALU control signal
    output logic [31:0] result,                // ALU result
    output logic        zero                   // Zero flag for branch decisions
);
// Todo:
    always_comb begin
        case (alu_control)
            4'b0000: result = a + b;                               // ADD
            4'b0001: result = a - b;                               // SUB
            4'b0010: result = a & b;                               // AND
            4'b0011: result = a | b;                               // OR
            4'b0100: result = a ^ b;                               // XOR
            4'b0101: result = a << b[4:0];                         // SLL (Logical shift left)
            4'b0110: result = a >> b[4:0];                         // SRL (Logical shift right)
            4'b0111: result = $signed(a) >>> b[4:0];               // SRA (Arithmetic shift right)
            4'b1000: result = ($signed(a) < $signed(b)) ? 1 : 0;   // SLT (signed)
            4'b1001: result = (a < b) ? 1 : 0;                     // SLTU (unsigned)
            default: result = 32'h0000_0000;                       // Default case
        endcase
    end
// TOdo:
    // Set 'zero' flag if result is 0 (used by branch logic)
    assign zero = (result == 32'h0000_0000);

endmodule

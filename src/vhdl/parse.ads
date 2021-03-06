--  VHDL parser.
--  Copyright (C) 2002, 2003, 2004, 2005 Tristan Gingold
--
--  GHDL is free software; you can redistribute it and/or modify it under
--  the terms of the GNU General Public License as published by the Free
--  Software Foundation; either version 2, or (at your option) any later
--  version.
--
--  GHDL is distributed in the hope that it will be useful, but WITHOUT ANY
--  WARRANTY; without even the implied warranty of MERCHANTABILITY or
--  FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
--  for more details.
--
--  You should have received a copy of the GNU General Public License
--  along with GHDL; see the file COPYING.  If not, write to the Free
--  Software Foundation, 59 Temple Place - Suite 330, Boston, MA
--  02111-1307, USA.
with Types; use Types;
with Iirs; use Iirs;

package Parse is
   --  If True, create nodes for parenthesis expressions.
   Flag_Parse_Parenthesis : Boolean := False;

   -- Parse an expression.
   -- (Used by PSL).
   function Parse_Expression return Iir;
   function Parse_Expression_Rhs (Left : Iir) return Iir;

   -- Parse an relationnal operator and its rhs.
   function Parse_Relation_Rhs (Left : Iir) return Iir;

   --  Convert the STR (0 .. LEN - 1) into a operator symbol identifier.
   --  Emit an error message if the name is not an operator name.
   function Str_To_Operator_Name (Str_Id : String8_Id;
                                  Len : Nat32;
                                  Loc : Location_Type) return Name_Id;

   --  Convert string literal STR to an operator symbol.
   --  Emit an error message if the string is not an operator name.
   function String_To_Operator_Symbol (Str : Iir) return Iir;

   -- Parse a single design unit.
   -- The scanner must have been initialized, however, the current_token
   -- shouldn't have been set.
   -- At return, the last token accepted is the semi_colon that terminates
   -- the library unit.
   -- Return Null_Iir when end of file.
   function Parse_Design_Unit return Iir_Design_Unit;

   --  Parse a file.
   --  The scanner must habe been initialized as for parse_design_unit.
   --  Return Null_Iir in case of error.
   function Parse_Design_File return Iir_Design_File;
end Parse;

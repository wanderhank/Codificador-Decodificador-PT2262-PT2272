
#gedit *.sv & 
echo  "================================================="
#sed -i 's/\[\([0-9]\+\)\]/_\1/g' teste_violacoes_mapped.v
#sed -i 's/\\//g' teste_violacoes_mapped.v
#sed -i 's/\\]//g' teste_violacoes_mapped.sdf
#sed -i 's/\\[/_/g' teste_violacoes_mapped.sdf
rm *.sdf.X
xrun -gui -sdf_cmd_file sdf.cmd -timescale 1ns/10ps -access +rw fast_*.v tb_codificador_decodificador.sv mapped/*mapped.sv comp_endereco.sv

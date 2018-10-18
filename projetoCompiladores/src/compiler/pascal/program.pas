Program CalcularSalario;
    Var TempoEmAnos : Integer; 
    Var ValorSalario: real; 
    Begin 
        If (TempoEmAnos > 10) Then 
            ValorSalario := 100.00; 
        Else 
            ValorSalario := ValorSalario * 2; 
    End;

    Write("Processamento feito com sucesso")
End.
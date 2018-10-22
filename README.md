# ProjetoCompiladores
Repositório com o projeto da disciplina Compiladores do período 2018.2

* Para executar o analisador Léxico, siga os seguintes passos:
  * Adicione o .jar do java_cup ao buildpath do projeto;
  * Adicione o .jar do jflex ao buildpath do projeto.(Localizado na pasta do jflex/lib);
  * Execute a classe GeneratorPascal no pacote pascal.lexicanalyzer;
  * Após isso, um arquivo LexicalAnalyzer.java deverá ser gerado;
  * Vá até a pasta que estão os arquivos do projeto via terminal, após isso localize o .jar do java_cup e execute a seguinte linha de comando: java -jar C:\cup\java-cup-11b.jar -parser Parser -symbols Sym .\Parser.cup (Obs: após o -jar, adicione o caminho do .jar do java_cup do seu computador);
  * Após isso, um arquivo Sym.java e outro Parser.java deverão ter sido gerados. (Já adicionados nesse repositório).

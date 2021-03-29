enum Entrada { NFC, VOZ, TECLADO, NONE }

enum Apresentacao { IMAGEM, VIDEO, TEXTO, AUDIO, NONE }

class Settings {
  Entrada entrada = Entrada.NONE;
  Apresentacao apresentacao = Apresentacao.NONE;

  bool conhecimento_is_voz = false;
  int conhecimento_voz_tempo = 0;
  bool conhecimento_is_teclado = false;
  int conhecimento_teclado_tempo = 120;

  bool localizacao_is_voz = false;
  int localizacao_voz_tempo = 0;
  bool localizacao_is_nfc = false;
  int localizacao_nfc_tempo = 0;
  bool localizacao_is_teclado = false;
  int localizacao_teclado_tempo = 120;

  int max_tentativas = 1;

  String toString() {
    String aux = "";

    aux += "entrada...................: " + this.entrada.toString() + "\n";
    aux += "apresentacao..............: " + this.apresentacao.toString() + "\n";
    aux += "----------------------------\n";
    aux += "conhecimento_is_voz.......: " +
        this.conhecimento_is_voz.toString() +
        "\n";
    aux += "conhecimento_is_teclado...: " +
        this.conhecimento_is_teclado.toString() +
        "\n";
    aux += "localizacao_is_voz........: " +
        this.localizacao_is_voz.toString() +
        "\n";
    aux += "localizacao_is_nfc........: " +
        this.localizacao_is_nfc.toString() +
        "\n";
    aux += "localizacao_is_teclado....: " +
        this.localizacao_is_teclado.toString() +
        "\n";
    aux += "----------------------------\n";
    aux += "conhecimento_voz_tempo....: " +
        this.conhecimento_voz_tempo.toString() +
        "\n";
    aux += "conhecimento_teclado_tempo: " +
        this.conhecimento_teclado_tempo.toString() +
        "\n";
    aux += "localizacao_voz_tempo.....: " +
        this.localizacao_voz_tempo.toString() +
        "\n";
    aux += "localizacao_nfc_tempo.....: " +
        this.localizacao_nfc_tempo.toString() +
        "\n";
    aux += "localizacao_teclado_tempo.: " +
        this.localizacao_teclado_tempo.toString() +
        "\n";
    aux += "----------------------------\n";
    aux += "max_tentativas............: " + this.max_tentativas.toString();

    return aux;
  }
}

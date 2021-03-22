enum Entrada {
  NFC, VOZ, TECLADO, NONE
}

enum Apresentacao {
  IMAGEM, VIDEO, TEXTO, AUDIO, NONE
}

class Settings {
  Entrada entrada = Entrada.NONE;
  Apresentacao apresentacao = Apresentacao.NONE;
  
  bool conhecimento_is_voz = false;
  int  conhecimento_voz_tempo = 0;
  bool conhecimento_is_teclado = false;
  int  conhecimento_teclado_tempo = 0;

  bool localizacao_is_voz = false;
  int  localizacao_voz_tempo = 0;
  bool localizacao_is_nfc = false;
  int  localizacao_nfc_tempo = 0;
  bool localizacao_is_teclado = false;
  int  localizacao_teclado_tempo = 0;

  int max_tentativas = 1;

} 

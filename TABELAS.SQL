create table GameWave(
	Id_GameWave Int primary key
);

CREATE TABLE Lives(
	id_live Int PRIMARY KEY,
	Streamers VARCHAR(255),
	Horario Time,
	fk_Id_GameWave Int References GameWave(Id_GameWave)
);

CREATE TABLE Usuario(
	Id_Usuario Int PRIMARY KEY,
	NickName VARCHAR(255),
	Idade Int,
	Login VARCHAR(255)
);

CREATE TABLE Notifica(
	fk_Id_Usuario Int REFERENCES Usuario(Id_Usuario),
	fk_Id_GameWave Int REFERENCES GameWave(Id_GameWave)
);

CREATE TABLE Assistem(
	fk_Id_Usuario Int REFERENCES Usuario(Id_Usuario),
	fk_Id_Live Int REFERENCES Lives(Id_Live)
);

CREATE TABLE Campeonato(
	Id_Campeonato Int PRIMARY KEY,
	Nome VARCHAR(255)
);

CREATE TABLE Proporciona(
	fk_Id_GameWave Int REFERENCES GameWave(Id_GameWave),
	fk_id_Campeonato Int REFERENCES Campeonato(Id_Campeonato)
);

CREATE TABLE Criam(
	fk_Id_Campeonato Int REFERENCES Campeonato(Id_Campeonato),
	fk_Id_Usuario Int REFERENCES Usuario(Id_Usuario)
);

CREATE TABLE Equipe(
	Nome VARCHAR(255),
	Quantidade_Jogadores Int,
	Solo Boolean,
	Id_Equipe Int PRIMARY KEY
);

CREATE TABLE Jogador(
	NickName VARCHAR(255),
	Id_Jogador Int PRIMARY KEY,
	fk_Id_Equipe Int REFERENCES Equipe(Id_Equipe)
);

CREATE TABLE Tem(
	fk_Id_Jogador Int REFERENCES Jogador(Id_Jogador),
	fk_Id_Campeonato Int REFERENCES Campeonato(Id_Campeonato)
);

ALTER TABLE Equipe ADD COLUMN fk_Id_Jogador Int

ALTER TABLE Equipe
ADD CONSTRAINT fk_Id_Jogador
FOREIGN KEY (fk_id_Jogador)
REFERENCES Jogador (Id_Jogador)

CREATE TABLE Jogos(
	Nome VARCHAR(255),
	Quant_Jogadores Int,
	Id_Jogo Int PRIMARY KEY,
	Temp_Partida TIME,
	fk_Id_Campeonato Int REFERENCES Campeonato(Id_Campeonato)
);

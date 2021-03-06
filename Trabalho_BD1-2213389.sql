CREATE TABLE ADMINISTRACAO (
	idAdm INTEGER PRIMARY KEY,
    login VARCHAR(50),
    hora_sistema DATE
);

CREATE TABLE MENSALIDADE_PAG (
	recibo INTEGER PRIMARY KEY,
    vencimento DATE,
    dataHora_pag DATE
);

CREATE TABLE CONTROLA (
	idAdm INTEGER,
	recibo INTEGER,
    PRIMARY KEY(idAdm, recibo),
    FOREIGN KEY(idAdm) REFERENCES ADMINISTRACAO(idAdm),
    FOREIGN KEY(recibo) REFERENCES MENSALIDADE_PAG(recibo)
);

CREATE TABLE INSCRICAO (
	nroContrato INTEGER PRIMARY KEY,
    dataInicio DATE,
    modContrato VARCHAR(20)
);

CREATE TABLE TRATA (
	idAdm INTEGER,
    nroContrato INTEGER,
    PRIMARY KEY(idAdm, nroContrato),
    FOREIGN KEY(idAdm) REFERENCES ADMINISTRACAO(idAdm),
    FOREIGN KEY(nroContrato) REFERENCES INSCRICAO(nroContrato)
);

CREATE TABLE ALUNOS (
	cpf CHAR(11) PRIMARY KEY,
    nome VARCHAR(100),
    telefone VARCHAR(20)
);

CREATE TABLE POSSUEM (
	cpf CHAR(11),
    nroContrato INTEGER,
    PRIMARY KEY(cpf, nroContrato),
    FOREIGN KEY(cpf) REFERENCES ALUNOS(cpf),
    FOREIGN KEY(nroContrato) REFERENCES INSCRICAO(nroContrato)
);

CREATE TABLE PAGAM (
	cpf CHAR(11),
    recibo INTEGER,
    PRIMARY KEY(cpf, recibo),
    FOREIGN KEY(cpf) REFERENCES ALUNOS(cpf),
    FOREIGN KEY(recibo) REFERENCES MENSALIDADE_PAG(recibo)
);

CREATE TABLE ALIMENTACAO (
	idAlimento INTEGER PRIMARY KEY,
    produtos VARCHAR(35),
    porcoes FLOAT
);

CREATE TABLE CONSOMEM (
	idAlimento INTEGER,
    cpf CHAR(11),
    PRIMARY KEY(idAlimento, cpf),
    FOREIGN KEY(idAlimento) REFERENCES ALIMENTACAO(idAlimento),
    FOREIGN KEY(cpf) REFERENCES ALUNOS(cpf)
);

CREATE TABLE NUTRICIONISTA (
	crn CHAR(15) PRIMARY KEY,
    nome VARCHAR(100),
    rg CHAR(9)
);

CREATE TABLE CUIDA (
	crn CHAR(15),
	idAlimento INTEGER,
    PRIMARY KEY(crn, idAlimento),
    FOREIGN KEY(crn) REFERENCES NUTRICIONISTA(crn),
    FOREIGN KEY(idAlimento) REFERENCES ALIMENTACAO(idAlimento)
);

CREATE TABLE ENDERECO (
	cpf CHAR(11),
	numero INTEGER,
    rua VARCHAR(100),
    bairro VARCHAR(100),
    PRIMARY KEY(cpf, numero, rua, bairro),
    FOREIGN KEY(cpf) REFERENCES ALUNOS(cpf) ON DELETE CASCADE
);

CREATE TABLE MORAM( -- NAO FUNGA
	cpf CHAR(11),
    numero INTEGER,
    PRIMARY KEY(cpf, numero),
    FOREIGN KEY(numero) REFERENCES ENDERECO(numero),
    FOREIGN KEY(cpf) REFERENCES ALUNOS(cpf)
);

CREATE TABLE PROFESSORES_INSTRUTORES (
	idProf INTEGER PRIMARY KEY,
    nome VARCHAR(100),
    especialidade VARCHAR(25)
);

CREATE TABLE SALARIOS (
	idFuncionario INTEGER PRIMARY KEY,
    valor FLOAT,
    cargo VARCHAR(25)
);

CREATE TABLE RECEBEM (
	idProf INTEGER,
	idFuncionario INTEGER,
    PRIMARY KEY(idProf, idFuncionario),
    FOREIGN KEY(idProf) REFERENCES PROFESSORES_INSTRUTORES(idProf),
    FOREIGN KEY(idFuncionario) REFERENCES SALARIOS(idFuncionario)
);

CREATE TABLE AULAS_BOXE (
	idProf INTEGER,
    PRIMARY KEY(idProf),
    FOREIGN KEY(idProf) REFERENCES PROFESSORES_INSTRUTORES(idProf)
);

CREATE TABLE AULAS_ZUMBA (
	idProf INTEGER,
    PRIMARY KEY(idProf),
    FOREIGN KEY(idProf) REFERENCES PROFESSORES_INSTRUTORES(idProf)
);

CREATE TABLE MUSCULACAO (
	idProf INTEGER,
    PRIMARY KEY(idProf),
    FOREIGN KEY(idProf) REFERENCES PROFESSORES_INSTRUTORES(idProf)
);

CREATE TABLE EQUIPAMENTOS (
	nroEquip INTEGER PRIMARY KEY,
    qtdDisponivel INTEGER,
    autorizacao BOOLEAN
);

CREATE TABLE USAM (
	nroEquip INTEGER,
    idProf INTEGER,
    PRIMARY KEY(nroEquip, idProf),
    FOREIGN KEY(nroEquip) REFERENCES EQUIPAMENTOS(nroEquip),
    FOREIGN KEY(idProf) REFERENCES PROFESSORES_INSTRUTORES(idProf)
);

CREATE TABLE UTILIZAM (
	nroEquip INTEGER,
    idProf INTEGER,
    PRIMARY KEY(nroEquip, idProf),
    FOREIGN KEY(nroEquip) REFERENCES EQUIPAMENTOS(nroEquip),
    FOREIGN KEY(idProf) REFERENCES PROFESSORES_INSTRUTORES(idProf)
);

-- SHOW TABLES
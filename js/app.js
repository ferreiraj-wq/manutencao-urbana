const { createApp } = Vue;

createApp({
  data() {
    return {
      telaAtual: "inicio",
      filtroStatus: "",
      mensagem: "",
      proximoId: 1004,
      form: {
        tipo: "",
        endereco: "",
        descricao: "",
        localizacao: "",
        nomeFoto: ""
      },
      ocorrencias: [
        {
          id: 1001,
          tipo: "Buraco na via",
          endereco: "Avenida Afonso Pena, Centro",
          descricao: "Buraco próximo ao cruzamento, causando risco aos veículos.",
          localizacao: "-20.4599, -54.6156",
          status: "Aberta",
          data: "30/07/2026"
        },
        {
          id: 1002,
          tipo: "Semáforo com defeito",
          endereco: "Rua Ceará, Santa Fé",
          descricao: "Semáforo apagado no sentido centro.",
          localizacao: "-20.4488, -54.5932",
          status: "Em atendimento",
          data: "29/07/2026"
        },
        {
          id: 1003,
          tipo: "Sinalização danificada",
          endereco: "Avenida Gury Marques, Universitário",
          descricao: "Placa de sinalização caída no canteiro.",
          localizacao: "",
          status: "Concluída",
          data: "28/07/2026"
        }
      ]
    };
  },

  computed: {
    ocorrenciasFiltradas() {
      if (!this.filtroStatus) {
        return this.ocorrencias;
      }

      return this.ocorrencias.filter(
        ocorrencia => ocorrencia.status === this.filtroStatus
      );
    }
  },

  methods: {
    salvarOcorrencia() {
      this.ocorrencias.unshift({
        id: this.proximoId++,
        tipo: this.form.tipo,
        endereco: this.form.endereco,
        descricao: this.form.descricao,
        localizacao: this.form.localizacao,
        status: "Aberta",
        data: new Date().toLocaleDateString("pt-BR")
      });

      this.mensagem = "Ocorrência registrada com sucesso.";
      this.limparFormulario(false);

      setTimeout(() => {
        this.mensagem = "";
        this.telaAtual = "lista";
      }, 1200);
    },

    limparFormulario(limparMensagem = true) {
      this.form = {
        tipo: "",
        endereco: "",
        descricao: "",
        localizacao: "",
        nomeFoto: ""
      };

      if (limparMensagem) {
        this.mensagem = "";
      }
    },

    selecionarFoto(evento) {
      const arquivo = evento.target.files[0];
      this.form.nomeFoto = arquivo ? arquivo.name : "";
    },

    avancarStatus(ocorrencia) {
      const fluxo = ["Aberta", "Em atendimento", "Concluída"];
      const indiceAtual = fluxo.indexOf(ocorrencia.status);

      ocorrencia.status =
        indiceAtual === fluxo.length - 1
          ? fluxo[0]
          : fluxo[indiceAtual + 1];
    },

    totalPorStatus(status) {
      return this.ocorrencias.filter(
        ocorrencia => ocorrencia.status === status
      ).length;
    },

    classeStatus(status) {
      return {
        "status-aberta": status === "Aberta",
        "status-atendimento": status === "Em atendimento",
        "status-concluida": status === "Concluída"
      };
    }
  }
}).mount("#app");

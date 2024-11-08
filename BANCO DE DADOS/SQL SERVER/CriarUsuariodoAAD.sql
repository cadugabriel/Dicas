# PREMISSAS:
    --> Deverá possuir acesso de administrador ou co-administrador na Assinatura Azure
    --> Deverá ser administrador ou co-administrador no Azure Active Directory
    --> Deverá possuir usuário Administrador (SA) no Banco de Dados

# CONFIGURANDO:
    --> No recurso servidor Azure DB, deverá ser incluído um usuário do AAD como administrador
    --> Crie Grupos do tipo “Segurança” no Azure Active Directory e adicionar os usuários que farão parte do Grupo
    --> Autenticar no Banco de Dados com esse usuário que foi criado no primeiro passo (lembrando de selecionar como tipo de autenticação “Azure Active Directory - Universal with MFA”

# OPÇÃO 1: CRIANDO LOGIN ASSOCIADO AO GRUPO AAD:
    CREATE USER [<<nome do grupo>>] FROM EXTERNAL PROVIDER; 

# OPÇÃO 2: CRIADO LOGIN ASSOCIADO AO USUÁRIO ADD:
    CREATE USER [<<nome do usuário>>] FROM EXTERNAL PROVIDER;

# DAR GRANT AOS SCHEMAS NECESSÁRIOS
    GRANT SELECT ON SCHEMA::<<nome do schema>> TO [<<nome do grupo / usuário>>]
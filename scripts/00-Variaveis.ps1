# Recursos
$RG        = "rg-valence-rm562396"
$LOCAL     = "mexicocentral"
$PLANO     = "plan-valence-rm562396"
$WEBAPP    = "valence-rm562396"
$SQLSERVER = "sqlserver-valence-rm562396"
$SQLDB     = "bd_valence"
$SQLUSER   = "valenceadmin"

# Segredos
function Read-Segredo([string] $Mensagem) {
    $seguro = Read-Host $Mensagem -AsSecureString
    $ponteiro = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($seguro)
    try {
        [System.Runtime.InteropServices.Marshal]::PtrToStringBSTR($ponteiro)
    }
    finally {
        [System.Runtime.InteropServices.Marshal]::ZeroFreeBSTR($ponteiro)
    }
}

$SQLPASS     = Read-Segredo "Senha do administrador do SQL Server"
$JWTSECRET   = Read-Segredo "Segredo do JWT (mínimo de 32 caracteres)"
$LLMAPIKEY   = Read-Segredo "Chave da API do LLM (Enter para deixar vazia)"
$RABBITMQURI = Read-Segredo "URI do RabbitMQ (Enter para deixar vazia)"
$IAAPIKEY    = Read-Segredo "Chave da API do serviço de IA (Enter para deixar vazia)"

# Validação
if ($SQLPASS.Length -lt 8 -or $SQLPASS.Length -gt 128) {
    throw "A senha do SQL Server deve ter de 8 a 128 caracteres. Execute o 00-Variaveis.ps1 de novo."
}
if ($SQLPASS.ToLower().Contains($SQLUSER.ToLower())) {
    throw "A senha do SQL Server não pode conter o usuário $SQLUSER. Execute o 00-Variaveis.ps1 de novo."
}
if ($JWTSECRET.Length -lt 32) {
    throw "O segredo do JWT deve ter pelo menos 32 caracteres. Execute o 00-Variaveis.ps1 de novo."
}

# Ángel Saúl Sáyago Leiba

function menu {
    Clear-Host
    Write-Host "Iniciando Menu..."
    Write-Host "1. Ver Status del Perfil"
    Write-Host "2. Cambiar Status del Perfil"
    Write-Host "3. Ver Perfil de la Red Actual"
    Write-Host "4. Cambiar Perfil de la Red Actual"
    Write-Host "5. Ver Reglas de Bloqueo"
    Write-Host "6. Agregar Reglas de Bloqueo"
    Write-Host "7. Eliminar Reglas de Bloquo"
    Write-Host "0. Exit"
}
 
menu
 
while(($opt = Read-Host -Prompt "Selecciona un opcion") -ne "0"){
 
switch($opt){
        0 {"Exit";break}
        1 {
            Clear-Host
            Write-Host -ForegroundColor yellow "  +-----------------------+"
            Write-Host -ForegroundColor yellow "  | Ver Status del Perfil |"
            Write-Host -ForegroundColor yellow "  |-----------------------|"
            Write-Host -ForegroundColor yellow "  |       Opciones:       |"
            Write-Host -ForegroundColor yellow "  | Private   ó    Public |"
            Write-Host -ForegroundColor yellow "  +-----------------------+"
            try {
                Ver-StatusPerfil -ErrorAction Ignore
            } catch {
                Clear-Host
                Write-Host -ForegroundColor red -BackgroundColor white "A ingresado una opcion no valida. Por favor, vuelva a intentarlo."
            }
            pause;
            break
        }
        2 {
            Clear-Host
            Write-Host -ForegroundColor yellow "  +---------------------------+";
            Write-Host -ForegroundColor yellow "  | Cambiar Status del Perfil |";
            Write-Host -ForegroundColor yellow "  |---------------------------|";
            Write-Host -ForegroundColor yellow "  |         Opciones:         |";
            Write-Host -ForegroundColor yellow "  |   Private   ó    Public   |";
            Write-Host -ForegroundColor yellow "  +---------------------------+";
            try {
                Cambiar-StatusPerfil -ErrorAction Ignore
            } catch {
                Write-Host -ForegroundColor red -BackgroundColor white "A ingresado una opcion no valida. Por favor, vuelva a intentarlo."
            }
            pause; 
            break
        }
        3 {
            Clear-Host
            Ver-PerfilRedActual 
            pause;
            break
        }
        4 {
            Clear-Host
            Cambiar-PerfilRedActual
            pause;
            break
        }
        5 {
            Clear-Host
            Ver-ReglasBloqueo
            pause;
            break
        }
        6 {
            Clear-Host
            try {
                Agregar-ReglasBloqueo
            } catch {
                Write-Host -ForegroundColor red -BackgroundColor white "A ingresado un puerto no valido. El rango de puertos va del 0 al 65535, vuelva a intentarlo."
            }
            pause;
            break
        }
        7 {
            Clear-Host
            try {
                Eliminar-ReglasBloqueo
            } catch {
                Write-Host -ForegroundColor red -BackgroundColor white "No se ha agregado ninguna regla."
            }   
            pause;
            break    
        }
        default {
            Write-Host -ForegroundColor red -BackgroundColor white "Opcion invalida. Por favor, seleciona otra!"
            pause
        }
    }
menu
}

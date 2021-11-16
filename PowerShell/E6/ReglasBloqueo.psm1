# Ver-ReglasBloqueo
function Ver-ReglasBloqueo{  
    if(Get-NetFirewallRule -Action Block -Enabled True -ErrorAction SilentlyContinue){  
        Get-NetFirewallRule -Action Block -Enabled True  
    } else{  
        Write-Host "No hay reglas definidas aún"
    }
} 

# Agregar-ReglasBloqueo 
function Agregar-ReglasBloqueo{  
    $puerto = Read-Host -Prompt "Cuál puerto quieres bloquear?"  
    New-NetFirewallRule -DisplayName "Puerto-Entrada-$puerto" -Profile "Public" -Direction Inbound -Action Block -Protocol TCP -LocalPort $puerto -ErrorAction Stop
} 

# Eliminar-ReglasBloqueo 
function Eliminar-ReglasBloqueo{  
    $reglas = Get-NetFirewallRule -Action Block -Enabled True -ErrorAction "Stop"
    Write-Host "Reglas actuales"  
    foreach($regla in $reglas){  
        Write-Host "Regla:" $regla.DisplayName  
        Write-Host "Perfil:" $regla.Profile  
        Write-Host "ID:" $regla.Name  
        $opc = Read-Host -Prompt "Deseas eliminar esta regla [Y] Si [N] No"  
        if($opc -eq "Y"){  
            Remove-NetFirewallRule -ID $regla.name  
            break
        }  
    }  
}

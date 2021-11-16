# Ver-PerfilRedActual
function Ver-PerfilRedActual{  
    $perfilRed = Get-NetConnectionProfile  
    Write-Host "Nombre de red:" $perfilRed.Name  
    Write-Host "Perfil de red:" $perfilRed.NetworkCategory
}  

# Cambiar-PerfilRedActual 
function Cambiar-PerfilRedActual{  
    $perfilRed = Get-NetConnectionProfile  
    if($perfilRed.NetworkCategory -eq "Public"){  
        Write-Host "El perfil actual es p�blico"  
        $opc = Read-Host -Prompt "Quieres cambiar a privado? [Y] Si [N] No"  
        if($opc -eq "Y"){  
            Set-NetConnectionProfile -Name $perfilRed.Name -NetworkCategory Private  
            Write-Host "Perfil cambiado"  
        }  
    } else{  
        Write-Host "El perfil actual es privado"  
        $opc = Read-Host -Prompt "Quieres cambiar a p�blico? [Y] Si [N] No"  
        if($opc -eq "Y"){  
            Set-NetConnectionProfile -Name $perfilRed.Name -NetworkCategory Public 
            Write-Host "Perfil cambiado"  
        }  
    }  
    Ver-PerfilRedActual
}
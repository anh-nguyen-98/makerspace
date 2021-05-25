SELECT Role.roleID, Role.roleName, Permission.permissionID AS role_ID, Permission.permission AS permission_ID FROM Role
JOIN RolePermission ON (Role.roleID=RolePermission.roleID)
JOIN Permission ON (Permission.permissionID=RolePermission.perID);
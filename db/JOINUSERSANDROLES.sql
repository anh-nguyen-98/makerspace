SELECT MksUser.userID, MksUser.userFirstName, MksUser.userLastName, MksUser.userEmail, Role.roleID AS role_id, Role.roleName AS role_name, 
Permission.permissionID AS permission_ID, Permission.permission AS permission FROM MksUser
JOIN UserRoles ON (MksUser.userID=UserRoles.userID)
JOIN Role ON (Role.roleID=userRoles.roleID)
JOIN RolePermission ON (Role.roleID=RolePermission.roleID)
JOIN Permission ON (Permission.permissionID=RolePermission.perID);

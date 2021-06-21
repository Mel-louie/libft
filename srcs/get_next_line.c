/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   get_next_line.c                                    :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: user42 <user42@student.42.fr>              +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/06/11 14:50:58 by mdesfont          #+#    #+#             */
/*   Updated: 2021/06/21 13:12:00 by user42           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../includes/libft.h"

char		*gnl_strdup(const char *s)
{
	char	*dest;
	size_t	i;
	size_t	len;

	if (!s)
		return (NULL);
	len = ft_strlen((char*)s);
	dest = malloc(sizeof(char) * (len + 1));
	if (!dest)
		return (NULL);
	i = 0;
	while (i < len)
	{
		dest[i] = s[i];
		i++;
	}
	dest[i] = '\0';
	return (dest);
}

int		get_next_line(int fd, char **line)
{
	static char	buffer[1];
	int			ret;

	if (!line)
		return (-1);
	*line = gnl_strdup("");
	while ((ret = read(fd, buffer, 1)) > 0)
	{
		if (buffer[0] == '\n')
			return (1);
		if ((*line = ft_strjoinfree(*line, buffer)) == NULL)
			return (-1);
	}
	if (ret < 0)
		return (-1);
	
	return (ret);
}

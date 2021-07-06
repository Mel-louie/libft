/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   get_next_line.c                                    :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: louielouie <louielouie@student.42.fr>      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/06/11 14:50:58 by mdesfont          #+#    #+#             */
/*   Updated: 2021/07/06 10:27:01 by louielouie       ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

int	get_next_line(int fd, char **line)
{
	static char	buffer[32];
	int			ret;

	if (!line)
		return (-1);
	*line = ft_strndup("", 1);
	ret = read(fd, buffer, 1);
	while (ret > 0)
	{
		if (buffer[0] == '\n')
			return (1);
		*line = ft_strjoin(*line, buffer);
		if (*line == NULL)
			return (-1);
		ret = read(fd, buffer, 1);
	}
	if (ret < 0)
		return (-1);
	return (ret);
}

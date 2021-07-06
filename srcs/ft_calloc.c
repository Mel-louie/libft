/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_calloc.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: louielouie <louielouie@student.42.fr>      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/06/29 14:02:36 by user42            #+#    #+#             */
/*   Updated: 2021/07/06 10:27:01 by louielouie       ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

void	ft_bzero(void *s, size_t n)
{
	char			*m;
	unsigned int	i;

	m = (char *)s;
	i = 0;
	while (i < n)
	{
		m[i] = '\0';
		i++;
	}
}

void	*ft_calloc(size_t count, size_t size)
{
	char	*dst;

	dst = malloc(sizeof(char) * (count * size));
	if (!(dst))
		return (NULL);
	ft_bzero(dst, count * size);
	return (dst);
}

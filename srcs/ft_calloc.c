/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_calloc.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: mdesfont <mdesfont@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/06/29 14:02:36 by user42            #+#    #+#             */
/*   Updated: 2021/09/04 15:56:46 by mdesfont         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

int	alloc_error(int code)
{
	write(2, "Can't malloc.\n", 14);
	return (code);
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

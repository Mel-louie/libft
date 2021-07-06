/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_frees.c                                         :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: louielouie <louielouie@student.42.fr>      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/06/11 14:50:53 by mdesfont          #+#    #+#             */
/*   Updated: 2021/07/06 10:27:01 by louielouie       ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

void	*free_int_tab(int *stack)
{
	if (stack)
		free(stack);
	return (NULL);
}

void	*free_str(char *s)
{
	if (s)
		free(s);
	return (NULL);
}

char	**free_tab(char **tab)
{
	int	i;

	i = 0;
	while (tab[i])
	{
		free(tab[i]);
		i++;
	}
	free(tab);
	tab = NULL;
	return (tab);
}
